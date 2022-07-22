# imapfilter-kube
Imapfilter deployment on Kubernetes

It's recommended to include these manifest in a kustomization to deploy.
e.g.:
~~~
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
- ../../imapfilter-kube/kustomization
~~~