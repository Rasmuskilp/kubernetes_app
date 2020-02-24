FROM ubuntu:18.04
WORKDIR /home/ubuntu
ADD app /home/ubuntu/app
RUN apt-get update -y
RUN apt-get install python -y
RUN apt-get install nginx -y
RUN apt-get install nodejs -y
RUN apt-get install git -y
WORKDIR /home/ubuntu/app
RUN apt-get install npm -y
RUN apt-get upgrade -y
RUN npm install express --save
run npm install mongoose -y
run npm install ejs -y
run npm install faker --save
RUN export DB_HOST=mongodb://mongo:27017/posts
RUN node seeds/seed.js
EXPOSE 3000
CMD ["npm","start"]
