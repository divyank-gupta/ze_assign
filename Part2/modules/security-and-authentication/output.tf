output "ssh_key" {
  description = "ssh key generated by terraform"
  value       = "${aws_key_pair.generated_key.key_name}"
}

output "private-sg" {
  value = "${aws_security_group.sg2_private_machine_sg.id}"
}

output "public-sg" {
  value = "${aws_security_group.sg1_bastion_machine_sg.id}"
}