resource "null_resource" "ansible_provision" {
  provisioner "local-exec" {
    command = "cd ../ansible && ansible-playbook playbook.yml -i inventory --roles-path=."
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}
