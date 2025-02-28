resource "aws_instance" "dockerec2" {
  ami           = "ami-00c257e12d6828491"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.dp_key.key_name
  subnet_id     = aws_subnet.dpsubnet.id
  security_groups = [aws_security_group.dp_sg.id]

  provisioner "remote-exec" {
    inline = [ 
      "sudo apt update",
      " curl -fsSL https://get.docker.com -o install-docker.sh",
      "sudo sh install-docker.sh",
      "sudo docker info",
      "git clone https://github.com/gitaditya99/spring-petclinic.git",
      "cd spring-petclinic",
      "ls -al",
      "docker image build -t spc:1.0 .",
      "docker image ls",
      "aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 688567298785.dkr.ecr.us-west-2.amazonaws.com",
      "docker tag spc:1.0 688567298785.dkr.ecr.us-west-2.amazonaws.com/dev/cicdrepo:latest",
      "docker push 688567298785.dkr.ecr.us-west-2.amazonaws.com/dev/cicdrepo:latest"

     ]
    
  }
}