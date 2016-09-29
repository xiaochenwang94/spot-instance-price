cd /Users/wxc575843/Documents/papers/fxu/code/data/useast/m3medium
export AWS_ACCESS_KEY=AKIAJP4S766JHHA7JQ6Q
export AWS_SECRET_KEY=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
export JAVA_HOME=$(/usr/libexec/java_home)
export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.5.1
export PATH=$PATH:$EC2_HOME/bin
#ec2-describe-regions
ec2-describe-spot-price-history -H --instance-type m3.medium --start-time 2016-06-20T07:08:09 --end-time 2016-09-20T08:09:10 --product-description "Linux/UNIX" --availability-zone=us-east-1a > useast1a.txt
ec2-describe-spot-price-history -H --instance-type m3.medium --start-time 2016-06-20T07:08:09 --end-time 2016-09-20T08:09:10 --product-description "Linux/UNIX" --availability-zone=us-east-1b > useast1b.txt
ec2-describe-spot-price-history -H --instance-type m3.medium --start-time 2016-06-20T07:08:09 --end-time 2016-09-20T08:09:10 --product-description "Linux/UNIX" --availability-zone=us-east-1c > useast1c.txt
ec2-describe-spot-price-history -H --instance-type m3.medium --start-time 2016-06-20T07:08:09 --end-time 2016-09-20T08:09:10 --product-description "Linux/UNIX" --availability-zone=us-east-1d > useast1d.txt
ec2-describe-spot-price-history -H --instance-type m3.medium --start-time 2016-06-20T07:08:09 --end-time 2016-09-20T08:09:10 --product-description "Linux/UNIX" --availability-zone=us-east-1e > useast1e.txt
Rscript /Users/wxc575843/Documents/papers/fxu/Rcode/data_pre_process.R /Users/wxc575843/Documents/papers/fxu/code/data/useast/m3medium

# ec2-describe-spot-price-history -H --instance-type m3.medium --start-time 2016-09-12T00:00:00 --end-time 2016-09-12T20:00:00 --product-description "Linux/UNIX" --availability-zone=us-east-1a > tmp.txt
