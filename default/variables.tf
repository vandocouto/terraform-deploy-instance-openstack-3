variable "instancia" {
 default = 3
}

variable "image" {
  default = "ubuntu16"
}

variable "imagem_id" {
  default = "547ef523-ba8d-4dc7-abe5-62c9f76c4a2d"
}

variable "flavor" {
  default = "m2.medium"
}

variable "region" {
  default = "RegionOne"
}

variable "key_pair" {
  default = "infra-icasei"
}

variable "security_group" {
  default = "default"
}

variable "network_uuid" {
  default = "db4d047e-2ae2-4bf7-8323-668de66275b3"
}

variable "ssh_user_name" {
  default = "ubuntu"
}

variable "ssh_key_file" {
  default = "../chave/infra.pem"
}

variable "external_gateway" {
  default = "11702078-9429-4ada-bf84-d9166bd368f8"
}






