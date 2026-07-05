# PrivateMC
Private FullSIM production of MC samples for Run3-2024

Once you are at your favorite path on lxplus:

- cmsrel CMSSW_14_2_0  

- cd CMSSW_14_2_0/src 

- git clone https://github.com/Sumantifr/PrivateMC.git .
  
  *Don't forget .*

- scram b -j16

For submitting crab jobs:

- cd Configuration/GenProduction/test/

- Put the relevant gridpack to `Gridpacks` directory

  (VBF XtoYH gridpacks are in: `/eos/user/c/chatterj/XtoYH/Run3/VBF/Gridpacks/`)

- Use: submit_GEN.sh

- Put correct gridpack/input sample and uncomment the corresponding step   
