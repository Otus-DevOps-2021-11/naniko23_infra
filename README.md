# naniko23_infra
naniko23 Infra repository
# Лекция 5. Знакомство с облачной инфраструктурой Yandex.Cloud

### Способ подключения в одну строку:

Воспользуемся командой: 
`ssh -i ~/.ssh/appuser -A appuser@51.250.69.63 ssh -tt appuser@10.128.0.4`

### Дополнительное задание:

* Внести в ~/.ssh/config
```
Host bastion
        HostName 51.250.69.63
        User appuser
Host someinternalhost
        HostName 10.128.0.4
        User appuser
        ProxyJump bastion
```
* воспользоваться командой 
* `ssh someinternalhost`
* 
bastion_IP = 51.250.69.63
someinternalhost_IP = 10.128.0.4
