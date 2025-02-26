#Questa Source
/bin/csh
setenv PATH $PATH/tools/mentor/questasim/questasim/linux/mgls/bin:/tools/mentor/questasim/questasim/bin:/tools/mentor/questacdc/linux/bin:/tools/AP_18.1.rel.1/bin/rhel6-64
setenv LD_LIBRARY_PATH "/tools/mentor/questasim/questasim"
setenv MTI_HOME "/tools/mentor/questasim/questasim/"
setenv HOME_0IN "/tools/mentor/questacdc/linux"
setenv MGLS_HOME "/tools/mentor/questasim/questasim/linux/mgls"
setenv LM_LICENSE_FILE "1717@192.168.1.2:39484@192.168.1.2"
echo "Sourcing QuestaSim: Complete"

#VCS Source
echo "Sourcing VCS: Start"
setenv PATH $PATH/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin
setenv ICC_HOME "/hwetools/synosys/installed_tools/icc2/Q-2019.12-SP1"
setenv PATH "${ICC_HOME}/bin:$PATH"
setenv Prime_HOME "/hwetools/synosys/installed_tools/prime/S-2021.06-SP2"
setenv PATH "${Prime_HOME}/bin:$PATH"
setenv FORMALITY "/hwetools/synosys/installed_tools/fm/S-2021.06-SP2"
setenv PATH "${FORMALITY}/bin:$PATH"
setenv VCS_HOME "/hwetools/synosys/installed_tools/vcs/Q-2020.03-SP2-8"
setenv PATH "${VCS_HOME}/bin:$PATH"
#setenv ICV_HOME "/hwetools/synosys/installed_tools/icvalidator/Q-2019.12-SP1"
#setenv PATH "${ICV_HOME}/bin:$PATH"
setenv DC_HOME "/hwetools/synosys/installed_tools/syn/S-2021.06-SP4"
setenv PATH "${DC_HOME}/bin:$PATH"
setenv SPYGLASS_HOME "/hwetools/synosys/installed_tools/spyglass/S-2021.09-SP1/SPYGLASS_HOME"
setenv PATH "${SPYGLASS_HOME}/bin:$PATH"
setenv VERDI_HOME "/hwetools/synosys/installed_tools/verdi/Q-2020.03-SP2-8"
setenv PATH "${VERDI_HOME}/bin:$PATH"
setenv VC_STATIC_HOME "/hwetools/synosys/installed_tools/vc_static/U-2023.03-1"
setenv PATH "${VC_STATIC_HOME}/bin:$PATH"
#setenv VCLP_HOME "/hwetools/synosys/installed_tools/syn/P-2019.03-SP5-2"
#setenv PATH "${VCLP_HOME}/bin:$PATH"
#setenv ICV_WORKBENCH_HOME "/hwetools/synosys/installed_tools/icv_workbench/R-2020.09"
#setenv PATH "${ICV_WORKBENCH_HOME}/bin:$PATH"
setenv Fusion_Compiler_HOME "/hwetools/synosys/installed_tools/fusioncompiler/S-2021.06-SP2"
#setenv PATH "${DFT}/bin:$PATH"
#setenv LM_LICENSE_FILE 27020@ls01.trg.vlsiexpert.in
setenv SNPSLMD_LICENSE_FILE 27020@ls01.trg.vlsiexpert.in
setenv SNPSLMD_QUEUE true
#setenv LM_LICENSE_FILE 27020@seerlnx001.seerakademi.com
#setenv SNPSLMD_LICENSE_FILE 27020@seerlnx001.seerakademi.com
#setenv SYNPLCTYD_LICENSE_FILE 27020@seerlnx001.seerakademi.com
echo "Sourcing VCS: Complete"
