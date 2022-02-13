задание 5

Для сквозного подключения ssh -i ~/.ssh/appuser -A appuser@178.154.222.183 ssh -tt appuser@10.128.0.10

Доп задание в ~/.ssh/config вносим:
Host bastion
        HostName 178.154.222.183
        User appuser
Host someinternalhost
        HostName 10.128.0.10
        User appuser
        ProxyJump bastion
