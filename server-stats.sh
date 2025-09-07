#! /bin/bash

outfile="server-usage-$(date +%Y%m%d-%H%M).txt"


{
  echo "===== $(date) ====="
  top -b -n1 -o %MEM | head -12
  echo
  free -h
  cat /etc/os-release
  echo
  lsb_release -a
  echo
  df -h /dev/sdb4 --output=source,fstype,size,used,avail,pcent
  echo
} > "$outfile"

echo "Wrote stats to $outfile"




