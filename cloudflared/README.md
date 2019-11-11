# Setup a kubernetes tunnel

## Get an argo origin cert

Go to https://dash.cloudflare.com/argotunnel

Select a domain, download a cert as `cert.pem`

## Crete the kubernetes cert

```
kubectl create secret generic argo.yooser.xyz --from-file=./cert.pem 
```

## Deploy test endpoint

```
kubectl apply -f kubernetes-tunnel-test.yml
```

## Check the endpoint!

https://hello.yooser.xyz

## Check tunnel logs for any issues

For example:
```
kubectl logs hello-b9494c669-ft88t -c tunnel
```
