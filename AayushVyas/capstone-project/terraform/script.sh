"sudo apt-get update -y",
"sudo apt-get install uidmap",
"sudo groupadd docker",
"sudo usermod -aG docker ${azurerm_linux_virtual_machine.example.admin_username}",
# "curl -fsSL https://get.docker.com -o get-docker.sh",
# "DRY_RUN=1 sudo sh ./get-docker.sh",
"sudo systemctl disable --now docker.service docker.socket",
"curl -fsSL https://raw.githubusercontent.com/docker/docker-install/00ffef53adb59bf05f436612ce82b6640019d9d2/rootless-install.sh -o dockerd-rootless-setuptool.sh",
"dockerd-rootless-setuptool.sh install",
"sudo apt-get install -y dbus-user-session",
"curl -fsSL https://get.docker.com/rootless | sh",
"export PATH=/usr/bin:$PATH",
"export DOCKER_HOST=unix:///run/user/1000/docker.sock",
"systemctl --user start docker",
"systemctl --user enable docker",
"sudo loginctl enable-linger $(whoami)",
"sudo curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.17.0/kind-linux-amd64",
"sudo chmod +x ./kind",
"sudo mv ./kind /usr/local/bin/kind",
"echo GRUB_CMDLINE_LINUX='systemd.unified_cgroup_hierarchy=1' | sudo tee -a /etc/default/grub",
"sudo update-grub",
"sudo touch /etc/systemd/system/user@.service.d/delegate.conf",
"echo -e '[Service] \nDelegate=yes' | sudo tee -a /etc/systemd/system/${azurerm_linux_virtual_machine.example.admin_username}@.service.d/delegate.conf",
"systemd-run --scope --user kind create cluster --name k8s-cluster"




                            sudo kubectl config get-contexts
                            sudo kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
                            sudo kubectl create serviceaccount -n kubernetes-dashboard admin-user
                            sudo kubectl create clusterrolebinding -n kubernetes-dashboard admin-user --clusterrole cluster-admin --serviceaccount=kubernetes-dashboard:admin-user
                            sudo kubectl config get-contexts
                            sudo kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
                            sudo kubectl create serviceaccount -n kubernetes-dashboard admin-user
                            sudo kubectl create clusterrolebinding -n kubernetes-dashboard admin-user --clusterrole cluster-admin --serviceaccount=kubernetes-dashboard:admin-user
                            sudo helm repo add istio https://istio-release.storage.googleapis.com/charts
                            sudo helm repo update
                            sudo kubectl create namespace istio-system
                            sudo helm install istio-base istio/base -n istio-system
                            sudo helm install istiod istio/istiod -n istio-system --wait
                            sudo helm install istio-ingress istio/gateway -n istio-ingress --wait
                            sudo kubectl create namespace istio-ingress
                            sudo kubectl label namespace istio-ingress istio-injection=enabled


#####create the gateway service and virtual gw

kubectl apply -f - <<EOF
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: nginx-w-istio-nginx-ingress-gateway
spec:
  selector:
    istio: ingressgateway-private
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - "nginx-w-istio-nginx-ingress.app.com"
---
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: nginx-w-istio-nginx-ingress-vs
spec:
  hosts:
  - "nginx-w-istio-nginx-ingress.app.com"
  gateways:
  - nginx-w-istio-nginx-ingress-gateway
  http:
  - route:
    - destination:
        host: nginx-w-istio-nginx-ingress
        port:
          number: 8080
EOF

####create istio pvt
vi istio-pvt.yml
######add the following 
apiVersion: install.istio.io/v1alpha1
kind: IstioOperator
metadata:
  namespace: istio-system
  name: istio-operator
spec:
  profile: default
  components:
    ingressGateways:
      - name: istio-ingressgateway
        enabled: true
      - namespace: istio-system
        name: istio-ingressgateway-private
        enabled: true
        k8s:
          serviceAnnotations:
            service.kubernetes.io/ibm-load-balancer-cloud-provider-ip-type: "private"
  values:
    gateways:
      istio-ingressgateway:
        sds:
          enabled: true
###apply it
kubectl apply -f istio-pvt.yml