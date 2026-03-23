#!/bin/sh

useradd -m -s /bin/bash ansible
usermod -aG sudo ansible

echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
chmod 440 /etc/sudoers.d/ansible

mkdir -p /home/ansible/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAA... ваш публичный ключ управляющей ноды" > /home/ansible/.ssh/authorized_keys

chmod 700 /home/ansible/.ssh
chmod 600 /home/ansible/.ssh/authorized_keys
chown -R ansible:ansible /home/ansible/.ssh

echo "Готово! Пользователь ansible создан и SSH ключ добавлен"