resource "aws_key_pair" "deployer" {
  key_name   = "newkey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcxLBi4UxDY9mzusi95dw5FLIFerpmjeq25kvQeQEm3cZVpct2rB4bV1vd7xo8Lbh0qDDu4WuEJP/1/B8lde9R6IkjnhGRvQ2t2W52NUdfUOs6gwIfO7A29UiIllBBm5wpC8o8E4uJ8umH3510+Y2RhueUlQFhnegMhxo8yPmfg3u0QN3syewebxiDk6RDTSi1kxGuoX7uVxlNWDirHrevJ3VoZLI0grb+ryBJzOn/2b9YJzpDOCfsbCu5AnLiOoD9ffXfYHJWMMUjLmCgrsFW9wnrPZhTIJ0YayyVxi2oofGhopDeqDvJhzGwSpDT1J4OaajVnQqemfcrKfYXPje1vFiipFlxKK81QEOGis8f+EGntuA/sDJ2GgMThXo5G4FkqfTn4BnHrCMg9TNDlSkLxz5ZLrwVh3n73E4hXDfOehLQCjSyyu+CqriESIHJoxLi/z3DezKnoUfYSDXxDVmqkOgcNRKw4xn3q+33rCyq3GcAum5+tfMKd7WLSyi2vtU= yashadmin@ansible"
}
resource "aws_instance" "web" {
    count = var.instance_count
    ami           = var.ami 
    instance_type = var.instance_type
    availability_zone = element(var.az, (count.index))
    associate_public_ip_address = var.associate_public_ip_address
    key_name = aws_key_pair.deployer.key_name
    security_groups = [var.security_groups]
    subnet_id = element(var.subnet_id, (count.index))
    

    tags = {
        Name = "testing_instance_${var.env}_${count.index}"
    }
}
