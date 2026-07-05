NEVENTS=10

cmsDriver.py \
  --python_filename step4_miniaod_cfg.py \
  --eventcontent MINIAODSIM \
  --customise Configuration/DataProcessing/Utils.addMonitoring \
  --datatier MINIAODSIM \
  --fileout file:step4_miniaod.root \
  --conditions 150X_mcRun3_2024_realistic_v2 \
  --step PAT \
  --geometry DB:Extended \
  --filein file:step3_aod.root \
  --era Run3_2024 \
  --no_exec \
  --mc \
  -n ${NEVENTS}
