#!/bin/bash

# 1. Добавляем репозиторий
echo "deb [signed-by=/usr/share/keyrings/yandex.gpg] http://repo.yandex.ru/yandex-disk/deb/ stable main" | sudo tee /etc/apt/sources.list.d/yandex-disk.list

# 2. Загружаем и добавляем ключ в нужное место
wget -qO- http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG | gpg --dearmor | sudo tee /usr/share/keyrings/yandex.gpg > /dev/null

# 3. Обновляем список пакетов
sudo apt update

# 4. Устанавливаем Yandex.Disk
sudo apt install -y yandex-disk
