# DB instances on AWS & GCP using Terraform

Idea is to create basic DB instances (or with custom parameters) on our chosen environment using Terraform.

## Basic Setup (on macOS)

1. Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) ([Homebrew](https://brew.sh/) needs to be installed for this)
```bash
$ brew tap hashicorp/tap
$ brew install hashicorp/tap/terraform
```
To update to the latest version of Terraform, first update Homebrew.
```bash
$ brew update
```
Then, run the upgrade command to download and use the latest Terraform version.
```bash
$ brew upgrade hashicorp/tap/terraform
==> Upgrading 1 outdated package:
hashicorp/tap/terraform 0.15.3 -> 1.0.0
==> Upgrading hashicorp/tap/terraform 0.15.3 -> 1.0.0
```

2. Install [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html) <br />
The above link has the download link for aws cli package. Once its downloaded, follow the on-screen instructions.

3. Install [gcloud](https://cloud.google.com/sdk/docs/quickstart) <br />
Download the google-cloud-sdk archive, relevant to your hardware machine. Once its downloaded & extracted, follow the instructions below :
```bash
./google-cloud-sdk/install.sh
```
Run the following command to initialize the SDK :
```bash
./google-cloud-sdk/bin/gcloud init
```

## Logging in (for aws cli & gcp)

Log into aws cli & gcloud on your local machine, so it doesn't interfere with Terraform's execution. For example, this is how you can login for aws cli :
```bash
$ aws configure
AWS Access Key ID [None]: aws_access_key_id
AWS Secret Access Key [None]: aws_secret_access_key
Default region name [None]: 
Default output format [None]: 
```
Terraform wont be able to locate your account (or project in case of GCP), if you are not logged in.

## Creating DB instances

* [AWS](https://github.com/gaurav945/create_db/tree/master/aws)
* [GCP](https://github.com/gaurav945/create_db/tree/master/gcp)
