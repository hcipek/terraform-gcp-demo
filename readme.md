*terraform init*      => Directory Initialization.
*terraform fmt*       => Automatically updates configurations in the current directory for readability and consistency.
*terraform validate*  => Checking syntactically validity and internally consistency.
*terraform apply*     => Creates/Updates the Infrastructure. If you are applying destructive changes it will replace the resource instead of updating.
*terraform show*      => Inspecting the state of Infrastructure.
*terraform destroy*   => Destroys/Removes the Infrastructure.

**.tf File Format**

- **Terraform block**

  - It contains Terraform settings such as Required providers that Terraform will use to provision your infrastructure.
  - Each `required_provider` has the `source` attribute defines an optional hostname, a namespace and the provider type. 
  - Also `required_provider` has the *optional* `version` attribute. 

- **Providers**

  - A provider is a plugin that Terraform uses to create and manage your resources. 
  - You can define multiple provider blocks in a Terraform configuration to manage resources from different providers.

- **Resources**

  - A resource might be a physical component such as a server, or it can be a logical resource such as a Heroku application.
  - Resource blocks have two strings before the block: the *resource type* and the *resource name*
  - Together, the resource type and resource name form a unique ID for the resource.
  - Resource blocks contain arguments which you use to configure the resource. Arguments can include things like machine sizes, disk image names, or VPC IDs.
  - https://registry.terraform.io/providers/hashicorp/google/latest/docs