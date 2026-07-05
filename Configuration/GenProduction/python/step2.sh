NEVENTS=10

cmsDriver.py \
  --python_filename step2_digi_l1_hlt_cfg.py \
  --eventcontent PREMIXRAW \
  --customise Configuration/DataProcessing/Utils.addMonitoring \
  --datatier GEN-SIM-RAW \
  --fileout file:step2_digi_l1_hlt.root \
  --pileup_input "dbs:/Neutrino_E-10_gun/RunIIISummer24PrePremix-Premixlib2024_140X_mcRun3_2024_realistic_v26-v1/PREMIX" \
  --conditions 140X_mcRun3_2024_realistic_v26 \
  --step DIGI,DATAMIX,L1,DIGI2RAW,HLT:2024v14 \
  --procModifiers premix_stage2 \
  --geometry DB:Extended \
  --filein file:step1_lhegensim.root \
  --datamix PreMix \
  --era Run3_2024 \
  --no_exec \
  --mc \
  -n ${NEVENTS}
