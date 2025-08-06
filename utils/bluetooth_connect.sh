#! /usr/bin/bash

# Device MAC addresses
# Device 98:B6:EA:BE:89:38 GuliKit Controller XW
# Device 50:1F:C6:96:09:10 Ed’s AirPods Pro
# Device FC:58:FA:09:40:C9 TREBLAB Z2
# Device 08:EB:ED:D3:4C:C1 JBL VIBE BEAM


PS3="Select the BT device you want to connect: "

select bt in Kong_Pro Airpods_Pro Treblab_Z2 JBL_Vibe Quit
do
  case $bt in
	"Kong_Pro")
		echo "Connecting $bt"
		bluetoothctl connect 98:B6:EA:BE:89:38;;
	"Airpods_Pro")
		echo "Connecting $bt"
		bluetoothctl connect 50:1F:C6:96:09:10;;
	"Treblab_Z2")
		echo "Connecting $bt"
		bluetoothctl connect FC:58:FA:09:40:C9;;
	"JBL_Vibe")
		echo "Connecting $bt"
		bluetoothctl connect 08:EB:ED:D3:4C:C1;;
    "Quit")
	*)
		echo "No device chosen"
  esac
done

