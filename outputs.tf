output "vm_aws_ip" {
  description = "IP da maquina virtual criada na AWS"
  value       = aws_instance.vm.public_ip
}
