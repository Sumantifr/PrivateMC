NEVENTS=10
SEED=123456

cmsDriver.py Configuration/GenProduction/python/Hadronizer_NMSSM_XToYHto4B_dipoleRecoilOn_TuneCP5_13p6TeV_madgraph_pythia8.py \
  --python_filename step1_lhegensim_cfg.py \
  --eventcontent RAWSIM \
  --customise Configuration/DataProcessing/Utils.addMonitoring \
  --datatier GEN-SIM \
  --fileout file:step1_lhegensim.root \
  --conditions 140X_mcRun3_2024_realistic_v26 \
  --beamspot DBrealistic \
  --customise_commands "process.RandomNumberGeneratorService.externalLHEProducer.initialSeed=int(${SEED})
process.source.numberEventsInLuminosityBlock=cms.untracked.uint32(250)" \
  --step LHE,GEN,SIM \
  --geometry DB:Extended \
  --era Run3_2024 \
  --no_exec \
  --mc \
  -n ${NEVENTS}
