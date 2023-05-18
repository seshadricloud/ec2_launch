keypair_name        = "jenkins"
public_key_path     = "~/.ssh/id_rsa.pub"
private_key_path    = "~/Downloads/testprod.pem"
ami_id              = "ami-0da62eb5869c785b9"
instance_type       = "t2.micro"
subnet_id           = "subnet-0f779c1c97aee7257"
user_data           = <<-EOT
                      #!/bin/bash
                      wget -O /etc/yum.repos.d/jenkins.repo \
                      https://pkg.jenkins.io/redhat-stable/jenkins.repo
                      rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
                      yum upgrade
                      yum install java -y
                      java --version
                      yum install git -y
                      yum install jenkins -y
                      systemctl start jenkins
                      systemctl enable jenkins
                      systemctl status jenkins
                      EOT
instance_name       = "jenkins"
security_group_name = "jenkins_sg"
