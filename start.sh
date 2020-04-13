echo "Add environment info to .env file"
nowpwd=`pwd`
echo "WORKSPACE=$nowpwd" > .env
echo "TAG=template" >> .env
