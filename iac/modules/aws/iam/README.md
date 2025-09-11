# IAM

## Directory Structure Design

``` bash
📂permission-policy
┣ 📜main.tf
┣ 📜data.tf
┣ 📜versions.tf
┗ 📜outputs.tf
📂role
┣ 📜main.tf
┣ 📜data.tf
┣ 📜versions.tf
┗ 📜outputs.tf
📜README.md
```

## Resources

1. Permission Policy

    Conjunto especifico de permissões

2. Trust Policy

    AssumeRole


    Provisionamento -> GitHub

        action: AssumeRoleWithWebIdentity
        principal:
            ```terraform
            principals {
              type        = "Federated"
              identifiers = [
                "arn:aws:iam::${var.aws_account}:oidc-provider/token.actions.githubusercontent.com"
              ]
            }
            ```

    Acesso -> EC2, EKS

        action: AssumeRole
        principal:
        ```terraform
            principals {
              type        = "Service"
              identifiers = ["ec2.amazonaws.com"]
            }
        ```

3. Role

## Admin

1. Permission Policy

2. Trust Policy

3. Role

## Resource Owner

## Read

## Write
