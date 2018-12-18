#!/bin/bash
sudo -H ./HDSentinel -html -r 
sudo -H ./HDSentinel -r 
sudo -H chown $(whoami):$(whoami) report*.*
mkdir reports_bak/
mv -f report.html report_$(date +"%m_%d_%Y").html
mv -f report.txt report_$(date +"%m_%d_%Y").txt
if which google-chrome >/dev/null; then
   google-chrome report_$(date +"%m_%d_%Y").html
else
    firefox report_$(date +"%m_%d_%Y").html
fi
sudo -H mv -f report*.* reports_bak/
cd reports_bak/
sudo -H chown $(whoami):$(whoami) report*.*
clear
exit 0
