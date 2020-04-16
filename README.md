# docker_console
#build
sudo docker build -t testapi -f  Dockerfile .

#run
sudo docker run  -it --rm -p 80:80 --name testapi testapi

#check process
sudo docker ps -a

#check end point
sudo docker inspect containerId

#check access
sudo wget http://127.0.0.1
