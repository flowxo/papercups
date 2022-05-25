# Deploy changes to a DO app 
```doctl apps update <appid> --spec do-spec.staging.yml```
# For example
```doctl apps update 6e6e943c-e1c8-4d2a-a90d-dfbc0417021b --spec do-spec.staging.yml```

#Build container to deploy to DO
```docker build -t flowxo/papercups:v1 .```
#Tag
```docker tag flowxo/papercups:v1 registry.digitalocean.com/fxo-containers/flowxo/papercups```
#Push
```docker push registry.digitalocean.com/fxo-containers/flowxo/papercups```

#Create app on digital ocean
```doctl apps create --spec <specfile>```
#For example
```doctl apps create --spec do-spc.yml```