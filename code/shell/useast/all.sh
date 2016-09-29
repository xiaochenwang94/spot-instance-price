#!/bin/bash
echo 'getting d2.8xlarge...'
./getdata_d28xlarge.sh 
echo 'getting g2.xlarge...'
./getdata_g2xlarge.sh 
echo 'getting m3.medium...'
./getdata_m3medium.sh 
echo 'getting m4.xlarge...'
./getdata_m4xlarge.sh 
echo 'getting r3.large...'
./getdata_r3large.sh 
