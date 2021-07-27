#!/usr/bin/env bash

ACTION=$1
VSRC=discord_redirect
DSNK=$(pacmd info | grep -i "default sink name" | cut -d' ' -f4)

if [[ $ACTION = "create" ]]; then
	MOD_ID=$(pactl load-module module-virtual-source source_name=$VSRC source_properties=device.description=$VSRC uplink_sink=$DSNK)
	VSNK=$(pacmd list-sinks | grep -i 'device.class = "uplink sink"' -B1 | head -n1 | cut -d'"' -f2)
	echo -e "Creating input channel '$VSRC' with ID #$MOD_ID"

	pacmd load-module module-combine-sink slaves=$VSNK,$DSNK
elif [[ $ACTION = "destroy" ]]; then
	MOD_ID=$(pacmd list-sources | grep $VSRC -A 20 | grep module: | cut -d' ' -f2)
	echo -e "Destroying input channel '$VSRC' with ID #$MOD_ID"
	pacmd unload-module $MOD_ID
else
	echo -e "Invalid action: '$ACTION'"
	exit -1
fi
