script_location=${pwd}
LOG=/tmp/roboshop.log

yum install nginx -y &>>{log}
if [$? -eq 0] ; then
  echo succes
else
  echo fail
fi

rm -rf /usr/share/nginx/html/* &>>{log}
if [$? -eq 0] ; then
  echo succes
else
  echo fail
fi

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>{log}
if [$? -eq 0] ; then
  echo succes
else
  echo fail
fi
cd /usr/share/nginx/html &>>{log}
if [$? -eq 0] ; then
  echo succes
else
  echo fail
fi
unzip /tmp/frontend.zip &>>{log}
if [$? -eq 0] ; then
  echo succes
else
  echo fail
fi

cp ${script_location}/Files/nginx-roboshop.conf /ect/nginx/default.d/nginx-roboshop.conf &>>{log}
if [$? -eq 0] ; then
  echo succes
else
  echo fail
fi

systemctl restart nginx &>>{log}
if [$? -eq 0] ; then
  echo succes
else
  echo fail
fi