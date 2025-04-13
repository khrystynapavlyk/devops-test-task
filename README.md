# devops-test-task

# Guide to using Terraform

Move to the `terraform` directory in your terminal.

```bash
cd terraform
```

Export `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` for local global environment variables.

```bash
export AWS_ACCESS_KEY_ID="<put_your_access_key_id_here>"

export AWS_SECRET_ACCESS_KEY="<put_your_secret_access_key_here>"
```

You can see in `terraform.tfvars.example` variables that are required for terraform.

So, you need to copy `terraform.tfvars.example` to `terraform.tfvars` and update it with your values.

```bash
cp terraform.tfvars.example terraform.tfvars
```

So, now tou can initialize terraform.

```bash
terraform init
```

So, you can run terraform plan to see what will be created.

```bash
terraform plan
```

So, you can run terraform apply to create resources.

```bash
terraform apply -var-file="terraform.tfvars".
```

You will see the output like this:

```bash
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:
```

So, you need to type `yes` and press enter.

After inftrastructure is created you will see the output like this:

```bash
Outputs:

elastic_ip = "54.93.173.163"
```

It will be `public IP address` of your instance.

If you want to store terraform state in remote backend (AWS S3 bucket) and enable state locking you need to uncomment `lines 11-16` in `versions.tf`.

Note: you need to set your bucket name in `versions.tf`.

And then run terraform init again.

```bash
terraform init
```

You will see the output like this:

```bash
Do you want to copy existing state to the new backend?
  Pre-existing state was found while migrating the previous "local" backend to the
  newly configured "s3" backend. No existing state was found in the newly
  configured "s3" backend. Do you want to copy this state to the new "s3"
  backend? Enter "yes" to copy and "no" to start with an empty state.

  Enter a value:
```

So, you need to type `yes` and press enter.

After that you can run terraform plan and terraform apply again.

# Guide to using Ansible

Ansible version: 2.18.4

Move to the ansible directory in your terminal.

```bash
cd ansible
```

In `hosts.txt` you can see the IP address of your instance, you need to update it with your instance IP address, that you got from terraform output before.

And in `./group_vars/SERVER_1` you can see the variables that are used in playbooks.

You need to update `ansible_ssh_private_key_file` with your private key file path.

After that you can run ansible playbook.

```bash
ansible-playbook -i hosts.txt playbook.yaml
```

You will see the output like this:

```bash
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

So, you need to type "yes" and press enter.

After that you get access from `http://<your_instance_ip>:8080` and you can see the hello page.

# Guide to running locally

You can run the project locally using bash script `run.sh` that is in the root directory of the project.

So, you need to make it executable.

```bash
chmod +x run.sh
```

```bash
./run.sh
```

So, you can access the project from http://localhost:8080/ and you can see the hello page.
