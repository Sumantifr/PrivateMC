NEVENTS=10

cmsDriver.py \
  --python_filename step3_aod_cfg.py \
  --eventcontent AODSIM \
  --customise Configuration/DataProcessing/Utils.addMonitoring \
  --datatier AODSIM \
  --fileout file:step3_aod.root \
  --conditions 140X_mcRun3_2024_realistic_v26 \
  --step RAW2DIGI,L1Reco,RECO,RECOSIM \
  --geometry DB:Extended \
  --filein file:step2_digi_l1_hlt.root \
  --era Run3_2024 \
  --no_exec \
  --mc \
  -n ${NEVENTS}
