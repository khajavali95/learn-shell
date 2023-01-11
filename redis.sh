Script_location=$(pwd)
log=/tmp/robobshop.log

status_check(){
  if [ $? -eq 0 ]; then
    echo -e "\e[1;32msuccess\e[0m"
    else
      echo -e "\e[1;31mfialure\e[0m"
      echo "refer log file for more information, LOG - ${LOG}"
      exit 1
      fi
      }
print_head() {
  echo -e "\e[1m $1 \e[0m"
}

print_head "setup redis repo"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>${LOG}
status_check

print_head "enable redis 6.2 dnf module"
dnf module enable redis:remi-6.2 -y &>>${LOG}
status_check

Print_head "install redis"
yum install redis -y &>>${LOg}
Status_check

print_head "update redis listen adsress"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>${LOG}
Status_check

print_head "install mongodb"
systemctl enable mongod &>>${LOG}
Status_check

print_head "install mongodb"
systemctl restart mongod &>>${LOG}
Status_check
