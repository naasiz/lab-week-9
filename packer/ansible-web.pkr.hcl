packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
    ansible = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "packer-ansible-nginx"
  instance_type = "t2.micro"
  region        = "us-west-2"

  communicator = "ssh"
  ssh_username = "ubuntu"

  source_ami = "ami-00c257e12d6828491"
}

build {
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "ansible" {
    playbook_file = "../ansible/playbook.yml"
    user          = "ubuntu"

    extra_arguments = [
      "--extra-vars", "ANSIBLE_HOST_KEY_CHECKING=False"
    ]
  }
}
