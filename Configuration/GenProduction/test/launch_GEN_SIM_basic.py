from CRABClient.UserUtilities import config

#config = Configuration()
config = config()

config.section_("General")
config.General.requestName = "tmp"
config.General.requestName       = 'VBF_test'
config.General.workArea = 'crab_projects'
config.General.transferLogs = True
config.General.transferOutputs = True

config.section_("JobType")
config.JobType.pluginName = 'PrivateMC'
config.JobType.psetName = 'step1_lhegensim_cfg.py'
config.JobType.disableAutomaticOutputCollection = False
config.JobType.allowUndistributedCMSSW = True
config.JobType.maxJobRuntimeMin = 2700
config.JobType.maxMemoryMB = 2000
#config.JobType.numCores = 2
config.JobType.inputFiles        = ['Gridpacks/NMSSM_XToYH_VBF_MX_1000_MY_125_el9_amd64_gcc11_CMSSW_13_2_9_tarball.tar.xz']
config.JobType.pyCfgParams = ['gridpack=../NMSSM_XToYH_VBF_MX_1000_MY_125_el9_amd64_gcc11_CMSSW_13_2_9_tarball.tar.xz']

config.section_("Data")
config.Data.splitting = 'EventBased'
config.Data.unitsPerJob = 10
config.Data.totalUnits  = 1
config.Data.publication = False 
config.Data.publishDBS = 'phys03'
config.Data.outputDatasetTag     = 'VBF_trial'
config.Data.outputPrimaryDataset = config.General.requestName # dataset name

config.Data.outLFNDirBase = '/store/user/chatterj/VBFXtoYHto4b/'

config.section_("Site")
config.Site.storageSite = 'T2_DE_DESY'
