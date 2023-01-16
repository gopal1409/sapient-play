resource "null_resource" "null_copy_ssh_key_to_vm" {
  depends_on = [
    azurerm_linux_virtual_machine.webserver
  ]
  connection {
    type        = "ssh"
    host        = azurerm_linux_virtual_machine.webserver.public_ip_address
    user        = azurerm_linux_virtual_machine.webserver.admin_username
    private_key = "-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----"
  }
  
  provisioner "remote-exec" {
    inline = [
        "curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.17.0/kind-linux-amd64",
        "chmod +x ./kind",
        "sudo mv ./kind /usr/local/bin/kind",
        "sudo apt-get update",
        "sudo apt-get install -y ca-certificates curl gnupg lsb-release",
        "sudo mkdir -p  /etc/apt/keyrings",
        "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg",
        " echo \"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
        "sudo apt-get update",
        "sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin",
        "sudo kind create cluster",
        "sudo apt-get install -y ca-certificates curl",
        "sudo apt-get install -y apt-transport-https",
        "sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg",
        "echo \"deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main\" | sudo tee /etc/apt/sources.list.d/kubernetes.list",
        "sudo apt-get update",
        "sudo apt-get install -y kubectl",
        "curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3",
        "chmod 700 get_helm.sh",
        "./get_helm.sh",
        "sudo kubectl get nodes",
        "curl -L https://istio.io/downloadIstio | sh -",
        "cd istio-1.16.1/bin",
        "sudo cp istioctl /usr/bin/",
        "sudo istioctl install --set profile=demo -y"
    ]
  }

}
