#!/bin/bash

mkdir tempdir
mkdir tempdir/templates


cp design_project.py tempdir/.
cp -r templates/* tempdir/templates/.


echo "FROM python" > tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "COPY  ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY  design_project.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 8080" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/design_project.py" >> tempdir/Dockerfile

cd tempdir
docker build -t projectapp .
docker run -t -d -p 8080:8080 --name projectrunn projectapp
docker ps -a