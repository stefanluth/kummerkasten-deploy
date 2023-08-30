# kummerkasten-deploy

Dieses Repository dient zum Deployen des [Kummerkastens](https://github.com/stefanluth/kummerkasten).

## Deployment

Das `.env.template` benutzen, und die benötigten Daten eingeben.

```shell
mv .env.template .env
vim .env
```

Dann das Deployment-Skript ausführen.

```shell
sh deploy.sh
```
