# naniko23_infra
naniko23 Infra repository
# Лекция 5. Знакомство с облачной инфраструктурой Yandex.Cloud

### Способ подключения в одну строку:

Воспользуемся командой: 
`ssh -i ~/.ssh/appuser -A appuser@178.154.222.183 ssh -tt appuser@10.128.0.10`

### Дополнительное задание:

* Внести в ~/.ssh/config
```
Host bastion
        HostName 178.154.222.183
        User appuser
Host someinternalhost
        HostName 10.128.0.10
        User appuser
        ProxyJump bastion
```
* воспользоваться командой 
* `ssh someinternalhost`
