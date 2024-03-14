# Arreglar disco duro lleno por errores de PCI

1. Arrancamos en **modo "recovery"** Ubuntu:
   1. En el GRUB busca **"Opciones avanzadas"**, pulsa intro.
   2. En el siguiente menú busca **"Recovery mode"**.
   3. Cuando lo permita, abrimos **Terminal Root**.
2. Ahora que estamos dentro de la terminal como **ROOT**, hacemos lo siguiente para liberar disco lo primero:
   ```bash
    rm /var/log/syslog*
    rm /var/log/kern*
   ```
3. Cambiamos las opciones del kernel en el GRUB para pedir que no de errores del PCI. Editamos con nano o vi el archivo `/etc/default/grub`, buscamos la línea que contiene `GRUB_CMDLINE_LINUX_DEFAULT` y le añadimos al final `pci=noaer`, de manera que debe quedar así:
   ```bash
    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash pci=noaer"
   ```
4. **Muy importante**: Actualizamos GRUB para que lea este archivo, ejecutando el comando:
    ```bash
      update-grub
    ```
5. Reiniciamos con **reboot**.

