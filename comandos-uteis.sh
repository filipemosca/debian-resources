 #!/usr/bin/env bash

############ COMANDOS PARA GERENCIAR TEMPO DE BOOT ################# 
systemd-analyse # Para analizar o tempo de boot
systemd-analyse blame # O tempo de boot de cada serviço

free -ht # Avalia a memória

nano ~/.config/akonadi/akonadiserverrc # Para desabilitar o serviço akonadi. É só trocar StartServer=true por StartServer=false

sudo systemctl edit apt-daily.timer # Pra atrasar o serviço apt-daily que consome muito tempo de boot (cerca de 10 segundos na minha máquina). Ao invés de ser carregado no boot, ele vai ser executado entre 15 a 45 min após a inicialização.
# Esse comando cria o diretório apt-daily.timer.d em /etc/systemd/system/ e um arquivo override.conf
# É só colar o texto abaixo nesse arquivo.
[Timer]
OnBootSec=15min
OnUnitActiveSec=1d
AccuracySec=1h
RandomizedDelaySec=30min
