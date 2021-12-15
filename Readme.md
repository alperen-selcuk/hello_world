# HELLO WORLD PROJECT

this project uses Java(11), Maven, Docker, Helm, Kubernetes, Jenkins, Nginx Ingress, Google Cloud Platform


## 🚀 Languages and Tools:

<p align="left"> 
    <a href="https://www.java.com" target="_blank"> <img src="https://img.icons8.com/color/48/000000/java-coffee-cup-logo.png"/> </a>
    <a href="https://spring.io/projects/spring-boot" target="_blank"> <img src="https://img.icons8.com/color/48/000000/spring-logo.png"/> </a> 
    <a href="https://git-scm.com/" target="_blank"> <img src="https://img.icons8.com/color/48/000000/git.png"/> </a> 
    <a href="https://www.jenkins.io/" target="_blank"> <img src="https://img.icons8.com/color/48/000000/jenkins.png"/> </a>
    <a href="https://maven.apache.org" target"_blank"> <img src="https://img.icons8.com/ios/50/000000/maven-ios.png"/> </a>
    <a href="https://docker.com" target"_blank"> <img src="https://img.icons8.com/color/48/000000/docker.png"/> </a>
    <a href="https://kubernetes.io" target"_blank"> <img src="https://img.icons8.com/color/48/000000/kubernetes.png"/> </a>
    <a href="https://nginx.com" target"_blank"> <img src="https://img.icons8.com/color/48/000000/nginx.png"/> </a>
    <a href="https://cloud.google.com" target"_blank"> <img src="https://img.icons8.com/color/48/000000/google-cloud.png"/> </a>
    
    
    
</p>

you can find details:

* Java: https://www.oracle.com/technetwork/java/javase/downloads/jdk11-downloads-5066655.html
* Maven: https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html
* Docker: https://docs.docker.com/engine/installation/
* Helm: https://helm.sh
* Kubernetes: https://kubernetes.io/docs/tutorials/kubernetes-basics/


## Kubernetes Provisioning with Terraform

at the begining project we can provision Kubernetes cluster on Google Kubernetes Engine.

you can use this document: https://learn.hashicorp.com/tutorials/terraform/gke

![image](https://github.com/alperen-selcuk/mdns/blob/master/images/tf.gif?raw=true)

first type "terraform plan" for test our terraform files and after "terraform apply" to create kubernetes cluster. i have one kubernetes cluster now so i added only terraform plan command output as a gif.


## CI/CD structure

![image](https://user-images.githubusercontent.com/78741582/146261102-3ea5dbac-0240-4bd0-adb5-883d01a353e1.png)


project uses Jenkins for Continues Integration, uses Docker for Continues Delivery and uses Helm for Continues Deployment.

when has change and push master on repository github jenkins start a pipeline with multiple jobs.

![image](https://user-images.githubusercontent.com/78741582/146254349-6d538ef6-9367-4e24-b521-9fdef4e2b276.png)

* first job - sonar
1. stage: sonarqube check our code if has got any vulnerabilities or bugs. when quality gate response low point sonarqube triggered jenkins to abort pipeline.
* second job - build
1. stage, maven test and build, this job compile our java application, install dependency and give us an artifact.
2. stage, this stage use docker container for build image with Dockerfile. after build image push dockerhub with latest tag.
* third job - deploy
1. stage, create helm chart with latest image tag. push chartmuseum as tgz file with helm tag. 
2. stage, deploy helm chart on kubernetes cluster with google sdk. 



## Kubernetes Ingress 

both namespaces have got an ingress object. 

dev ingress has /todos path for backend to validate application is working on ui test stage.

below ingress use on prod namespace.

```
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: my-ingress
  namespace: default
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/use-regex: "true"
    ingress.kubernetes.io/rewrite-target: "/"
spec:
  rules:
  - host: hello-35-246-50-224.nip.io
    http:
      paths:
      - path: /
        backend:
          serviceName: hello-world-hello-world
          servicePort: 80
```

## Grafana 

if you want see pods metric you can use grafana operator. i have installed on kubernetes with below commands.

```
kubectl create ns monitoring
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring

![image](https://user-images.githubusercontent.com/78741582/146255743-b7b22782-8a10-4416-87cf-7d25e10142b8.png)



```

## Conclusion


this pipeline work properly. you can reach application use that link http://hello-35-246-50-224.nip.io


you can touch me whenever you want below platforms.

<p
    <a href="https://www.linkedin.com/in/hasan-alperen-selçuk-529a8a4a/" target"_blank"> <img src="https://img.icons8.com/color/48/000000/linkedin.png"/> </a>
     <a href="https://alperenhasanselcuk.medium.com" target"_blank"> <img src="https://img.icons8.com/color/48/000000/medium-logo--v2.png"/> </a>
</p>

