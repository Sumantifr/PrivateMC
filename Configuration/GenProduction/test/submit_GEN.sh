eventsperjob=10
totalevets=10
#step 1: LHE-GEN-SIM
gridpack="NMSSM_XToYH_VBF_MX_1000_MY_125_el9_amd64_gcc11_CMSSW_13_2_9_tarball.tar.xz"
#python3 launch_GEN_SIM.py --config step1_lhegensim_cfg --unitsPerJob ${eventsperjob} --totalUnits ${totalevets} --publish True --production_label _LHEGENSIM --gridpack ${gridpack} 
#step 2: DIGI-L1-HLT-Premix-RAW
GENsample="/NMSSM_VBF_XtoYHto4b_MX_1000_MY_125_test/chatterj-NMSSM_VBF_XtoYHto4b_MX_1000_MY_125_test-44f0cc7d5a29ef38daca1f4ac2fde313/USER"
python3 launch_GENtoRECO.py --config step2_digi_l1_hlt_cfg --unitsPerJob ${eventsperjob} --totalUnits ${totalevets} --publish True --production_label _DIGITrigPremix --InputSample ${GENsample}
#step 3: RECO (AOD)
DIGIsample="/NMSSM_VBF_XtoYHto4b_MX_1000_MY_125_test/chatterj-NMSSM_VBF_XtoYHto4b_MX_1000_MY_125_test-b3a4ca3ebd6fc8d263e6c12bfe4a9313/USER"
#python3 launch_GENtoRECO.py --config step3_aod_cfg --unitsPerJob ${eventsperjob} --totalUnits ${totalevets} --publish True --production_label _AOD --InputSample ${DIGIsample}
#step 4: MINIAOD
AODsample="/NMSSM_VBF_XtoYHto4b_MX_1000_MY_125_test/chatterj-NMSSM_VBF_XtoYHto4b_MX_1000_MY_125_AOD-6d308a8fda0e052646df33748b7e0a9c/USER"
#python3 launch_GENtoRECO.py --config step4_miniaod_cfg --unitsPerJob ${eventsperjob} --totalUnits ${totalevets} --publish True --production_label _MINIAOD --InputSample ${AODsample}
#step 5: NanoAOD
MINIAODsample="/NMSSM_VBF_XtoYHto4b_MX_1000_MY_125_test/chatterj-NMSSM_VBF_XtoYHto4b_MX_1000_MY_125_MINIAOD-91cf161387124c45403ac72dcbaaf3a0/USER"
#python3 launch_GENtoRECO.py --config step5_nanoaod_cfg --unitsPerJob ${eventsperjob} --totalUnits ${totalevets} --publish True --production_label _NanoAOD --InputSample ${MINIAODsample}
