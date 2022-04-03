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

## Лекция 6. Деплой тестового приложения

Скрипты install_ruby.sh, install_mongodb.sh и deploy.sh находятся в подпапке HW6

testapp_IP = 51.250.75.204
testapp_port = 9292

### Дополнительное задание:

Файл startup-script.yaml
Команда имеет следующий вид:
`yc compute instance create \
    --name reddit-app \
    --hostname reddit-app \
    --memory=4 \
    --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \ --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
    --metadata serial-port-enable=1 \
    --metadata-from-file user-data=/PATH_TO_LOCAL_REPO/naniko23_infra/startup-script.yaml`, где:

PATH_TO_LOCAL_REPO - путь к скачанному репозиторию.
