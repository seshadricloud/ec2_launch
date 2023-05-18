keypair_name        = "test"
public_key_path     = "~/.ssh/id_rsa.pub"
private_key_path    = "~/Downloads/testprod.pem"
ami_id              = "ami-0da62eb5869c785b9"
instance_type       = "t2.micro"
subnet_id           = "subnet-0f779c1c97aee7257"
user_data           = <<-EOT
                      #!/bin/bash
                      yum install httpd -y 
                      systemctl start httpd
                      systemctl enable httpd
                      EOT
instance_name       = "testprod"
security_group_name = "testprod_sg"
