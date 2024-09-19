# Arreglar disco duro lleno por errores de PCI

Este error suele estar relacionado con gráficas NVidia GTX 560 y 660. 

## Síntomas



## Solución 1

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
   En el caso de 
4. **Muy importante**: Actualizamos GRUB para que lea este archivo, ejecutando el comando:
    ```bash
      update-grub
    ```
5. Reiniciamos con **reboot**.

## Solución 2

Exactamente igual que el apartado anterior (solución 1) pero cambiamos el punto 3 por:

```bash
pcie_aspm=off
```

o bien, si este tampoco funcionó, por esto:

 ```bash
pci=nommconf
```
