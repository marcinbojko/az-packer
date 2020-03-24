# Azure's packer generated VMs with managed disks

## Idea

Uses same codebase and rules as [https://github.com/marcinbojko/hv-packer](https://github.com/marcinbojko/hv-packer)

## Requirements

* packer >= `1.5.4`. Do not use packer 1.3.0/1.3.1 - [https://github.com/hashicorp/packer/issues/6733](https://github.com/hashicorp/packer/issues/6733)
* Azure Subscription access and variables needed for packer

## Usage

To adjust to your Azure subscription, please check:

* secrets are being provided as vars file or passed as environmental variables
* example of secrets you'll need is ./secrets/secrets-example.json - adjust it to your needs

```json
{
    "azure_ad_tenant_id": "some-tenant-id",
    "azure_subscription_id": "some-subscription_id",
    "app_id": "some-app-id",
    "client_secret": "some-client-secret",
    "managed_image_resource_group_name": "some-resource-group-name",
    "location": "some-location"
}

```

### Windows machines

* all available updates will be applied (3 passes)
* latest chocolatey and packages will be installed:

  |Package|Version|
  |-------|-------|
  |puppet-agent|5.5.19|
  |conemu|latest|
  |dotnetfx|latest|
  |sysinternals|latest|
* latest Nuget poweshell module
* puppet agent settings will be customized (`server=foreman.spcph.local`). Please adjust it (`/extra/scripts/phase-3.ps1`) to suit your needs.

### Linux Machines

* Repositories:
  * EPEL 7
  * Zabbix 4.x
  * Puppet 5.x
  * Webmin
  * Neofetch

* adjust `/extra/files/provision.sh` to modify package's versions/servers
* `neofetch` packageas default banner during after the login - change required fields you'd like to see in `provision.sh`

## Templates

### Windows 2016 Datacenter

* script `windows2016dc.sh`

### Windows 2019 Datacenter

* script `windows2019dc.sh`

### CentOS 7.7

* script `centos7.sh`

### Warnings & workarounds

* as a temporary solution Windows based machines are using Admin account `adpacker` which is being deleted after creation
