NEVENTS=10

cmsDriver.py \
  --python_filename step5_nanoaod_cfg.py \
  --eventcontent NANOAODSIM \
  --customise Configuration/DataProcessing/Utils.addMonitoring \
  --datatier NANOAODSIM \
  --fileout file:step5_nanoaod.root \
  --conditions 150X_mcRun3_2024_realistic_v2 \
  --step NANO \
  --scenario pp \
  --filein file:step4_miniaod.root \
  --era Run3_2024 \
  --no_exec \
  --mc \
  -n ${NEVENTS}
