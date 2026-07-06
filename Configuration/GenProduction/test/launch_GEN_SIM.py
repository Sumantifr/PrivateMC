from CRABAPI.RawCommand import crabCommand
from WMCore.Configuration import Configuration
from CRABClient.UserUtilities import config, getUsername

import imp, os, sys
from optparse import OptionParser
import re

cfgPath    = os.path.expandvars( "$CMSSW_BASE/src/Configuration/GenProduction/test" )
allConfigs = [ x.split(".")[0] for x in os.listdir( cfgPath ) if x.endswith(".py") and x.startswith("step") ]

parser = OptionParser(usage="python launch.py [options] component1 [ component2 ...]", \
                          description="Launch private MC production with CRAB3.")
parser.add_option("--production_label", dest="production_label",                                  default="", help="production label")
parser.add_option("--unitsPerJob",      dest="unitsPerJob",      type=int,                        default=100,       help="Nr. of units (files) / crab job")
parser.add_option("--totalUnits",       dest="totalUnits",       type=int,                        default=20000,    help="Total nr. of units (files)")
parser.add_option("--config",           dest="config",                     choices = allConfigs,                   help="Which config?")
parser.add_option("--publish",          action='store_true',                                      default=False,   help="Publish on dbs?")
parser.add_option("--dryrun",           action='store_true',                                      default=False,   help="Test script?")
parser.add_option("--gridpackDir",      dest="gridpackDir",                                       default="Gridpacks",    help="gridpack directory for gen production")
parser.add_option("--gridpack",         dest="gridpack",                                          default="NMSSM_XToYH_VBF_MX_1000_MY_125_el9_amd64_gcc11_CMSSW_13_2_9_tarball.tar.xz",    help="gridpack name for gen production")
( options, args ) = parser.parse_args()

gridpackFile = os.path.expandvars( os.path.join( options.gridpackDir, options.gridpack ) )
cfgFile      = os.path.join( cfgPath, "%s.py" % options.config )

signal_match = re.search(r"MX_(\d+)_MY_(\d+)", options.gridpack)
mass_label="MX_"+signal_match.group(1)+"_MY_"+signal_match.group(2)

from CRABClient.UserUtilities import config

#config = Configuration()
config = config()

config.section_("General")
config.General.requestName = "tmp"
config.General.requestName       = 'NMSSM_VBF_XtoYHto4b_'+mass_label
config.General.workArea = 'crab_projects'
config.General.transferLogs = True
config.General.transferOutputs = True

config.section_("JobType")
config.JobType.pluginName = 'PrivateMC'
config.JobType.psetName = cfgFile
config.JobType.disableAutomaticOutputCollection = False
config.JobType.allowUndistributedCMSSW = True
config.JobType.maxJobRuntimeMin = 2700
config.JobType.maxMemoryMB = 2000
config.JobType.numCores = 1
config.JobType.inputFiles        = [gridpackFile]
config.JobType.pyCfgParams = ['gridpack=../'+options.gridpack]

config.section_("Data")
config.Data.splitting = 'EventBased'
config.Data.unitsPerJob = options.unitsPerJob
config.Data.totalUnits  = options.totalUnits
config.Data.publication = options.publish
config.Data.publishDBS = 'phys03'
config.Data.outputDatasetTag     = options.production_label
config.Data.outputPrimaryDataset = config.General.requestName # dataset name

config.Data.outLFNDirBase = '/store/user/%s/VBFXtoYHto4b/'% (getUsername())

config.section_("Site")
config.Site.storageSite = 'T2_DE_DESY'

if options.dryrun:
    print("Processing %s" %( options.gridpack ))
    print("## Dryrun, continue...")
    sys.exit(0)

crabCommand('submit', config=config)
