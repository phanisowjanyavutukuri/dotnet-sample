FROM microsoft/dotnet:1.1.0-sdk-projectjson

RUN apt-get update
RUN apt-get install python-software-properties
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install nodejs
RUN npm install -g bower
COPY builds.tar .
RUN apt-get install tar
RUN tar -xvf builds.tar
RUN cd publish/ 
RUN dotnet Webapplication1.dll --server.urls http://0.0.0.0:5000
