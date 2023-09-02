# kummerkasten-deploy

Dieses Repository dient zum Deployen des [Kummerkastens](https://github.com/stefanluth/kummerkasten)
in ein Kubernetes Cluster.

## Deployment

```shell
kubectl create secret generic telegram-secrets \
    --from-literal=bot-token="YOUR_BOT_TOKEN" \
    --from-literal=user-id="YOUR_USER_ID"
```

```shell
kubectl apply -f kummerkasten-deployment.yaml
```
