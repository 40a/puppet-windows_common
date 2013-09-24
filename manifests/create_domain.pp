# Class: windows::commands
#
# This module defines reused commands for windows
#
# Parameters: none
#
# Actions:
#


class windows_common::create_domain{

  # Define: windows::commands::create_ad_domain
  # Create an Active Directory Domain
  #
  define create_ad_domain ( $::domain_name, $::netbios_name, $::domain_user, $::domain_passwd,){
    exec {'create_active_directory_domain':
      command => "powershell.exe -executionpolicy remotesigned -Command Install-ADDSForest -CreateDNSDelegation:\$false -DatabasePath \"${::windir}\\NTDS\" --DomainMode \"Win2012\" -DomainName \"${::domain_name}\" -DomainNetbiosName \"${::netbiso_name}\" -ForestMode \"Win2012\" -InstallDNS:\$true -LogPath \"${::windir}\\NTDS\" -NoRebootOnCompletion:\$false -SysVolPath \"${::windir}\\SYSVOL\" -Force:\$true",
      unless  => 'powershell.exe -executionpolicy remotesigned -Command Import-Module ADDSDeployment',
    }
  }

}