#!/usr/bin/env zsh

ccyccy=usdjpy
datatype=tick

for y in {2007..2023}; do
	for m in {01..12}; do
		d=$(date -v"${y}"y -v"${m}"m -v01d -v+1m -v-1d +%d)
		fn="download/${ccyccy}-${datatype}-${y}-${m}-01-${y}-${m}-${d}.csv"
		if [ ! -f "${fn}" ]; then
			npx dukascopy-node -i ${ccyccy} -from ${y}-${m}-01 -to ${y}-${m}-${d} -t ${datatype} -f csv &
		fi
	done
	wait
done
