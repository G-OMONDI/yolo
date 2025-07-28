resource "null_resource" "provision" {
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory ansible/playbook.yml"
  }
}
