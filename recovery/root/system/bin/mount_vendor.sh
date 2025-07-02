#!/system/bin/sh

i=0

echo "Starting mount_vendor.sh...." | tee /dev/kmsg > /dev/null

while true; do

    keycheck

    if [ $? -eq 41 ]; then
        # Incrementa il contatore
        ((i++))
        echo "Volume down detected, $i" | tee /dev/kmsg > /dev/null

    fi

    # Controlla se il contatore è uguale a 2
    if [ "$i" -eq 2 ]; then
        echo "mount_vendor triggered..." | tee /dev/kmsg > /dev/null
        break
    fi

    sleep 1
done

twrp mount /vendor
