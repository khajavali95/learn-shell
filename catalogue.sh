script_location={pwd}
set -e

curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
#useradd roboshop

mkdir -p /app
curl -L -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
rm -rf /app/*
cd /app
unzip /tmp/catalogue.zip
cd /app
npm install

cp ${script_location}/Files/catalogue.repo /etc/systemd/system/catalogue.repo
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue
yum install mongodb-org-shell -y

mongo --host mongodb-dev.khajavali1995.online </app/schema/catalogue.js