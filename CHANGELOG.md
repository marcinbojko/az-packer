# Changelog

## 2021-04-15 - Version 1.0.5

* upgraded `extras`
* bump centos7 version to 7.9 Generation 2
* added Ubuntu 20.04 Generation 2

## 2020-08-12 - Version 1.0.4

* upgraded `extras`
* bump centos7 version to 7.8
* change `"provision_script_options"` variable to:
  * -p (true/false) - switch Install Puppet on/off
  * -w (true/false) - switch Install Webmin on/off (CentOS7 only)
  * -h (true/false) - switch Install Hyper-V integration services on/off
  * -u (true/false) - switch yum update all on/off (usable when creating previous than `latest` version of OS)
  * -z (true/false) - switch Zabbix-agent installation
  * -c (true/false) - switch Cockpit installation (CentOS8 only)

## 2020-03-24 - Version 1.0.3

* upgraded `extras`
  * `provision.sh` now takes paremeters from `provision_script_options` variable.
  * adjust `/files/provision.sh` to modify package's versions/servers.
  * change "provision_script_options" variable to:
    * -p (true/false) - switch Install Puppet on/off
    * -w (true/false) - switch Install Webmin on/off
    * -h (true/false) - switch Install Hyper-V integration services on/off
    * -u (true/false) - switch yum update all on/off (usable when creating previous than `latest` version of OS)

    ```json
    "provision_script_options": "-p false -u true -w true -h false"
    ```

* reworked running scrips
* removed all, non-managed disks packer templates

## 2019-08-31 - Version 1.0.2

* upgraded `extras`

## 2019-03-05 Version 1.0.1

* `extra` - added more verbosity and try/catch pair in `/azure/bootstrap.ps1` and `/azure/post-phase-4.ps1`
* `extra` - removed .netframwework 3.5 and powershell 2 from installed features
* added extra step as `bootstrap.cmd` - some Windows 2016 Microsoft images were unable to process powershell script via packer until elevated privileges were added
* expanded both Windows 2016 and Windows 2019 with image.state check after deprovisioning.
* tested with `packer` version  1.3.5

## 2019-03-03 Version 1.0.0 - Initial release
