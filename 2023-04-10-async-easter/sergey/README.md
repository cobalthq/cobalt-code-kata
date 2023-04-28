# Use GCP Secrets for Environment Variables

The idea is shamelessly stolen from the Infra Team. To get yourself going copy
secret variables:

```shell
cp secrets-examples.tfvars secrets.tfvars
```

After that put your variable names with values there. You only need it to apply
terraform and can delete the file afterwards. Make sure you have the right
project name too.

If you use asdf, install the right terraform version, but it will work
on anything recent enough. Then run `terraform init`.

To apply run:

```shell
terraform apply -var-file="secrets.tfvars"
```

This should propose creating 2 resources. Once applied you can use the following
command to export variables from the secret (make sure the project name
is the same in secrets.tfvars and in this command):

```shell
export $(gcloud secrets versions access latest --secret sergey-environment --project "!!!gcp-name!!!" | paste -sd" " -)
```

The advantage is that once you close the terminal, the variables are gone. You
can also make it a shell alias or function in case you have multiple secrets.
