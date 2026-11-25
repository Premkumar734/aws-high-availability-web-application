
#!/bin/bash
dnf update -y
dnf install -y httpd

systemctl enable httpd
systemctl start httpd

INSTANCE_ID=$(TOKEN=$(curl -s -X PUT \
  "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600") && \
  curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/instance-id)

cat > /var/www/html/index.html <<EOF
<html>
<head><title>AWS HA Application</title></head>
<body>
<h1>AWS High Availability Web Application</h1>
<h2>Welcome!</h2>
<p>Server Instance: $INSTANCE_ID</p>
<p>Hosted on AWS EC2</p>
</body>
</html>
EOF

systemctl restart httpd
