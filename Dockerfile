# base image selection
FROM ubuntu

# now we need to install nodejs on top of ubuntu
# rather there's a node image that has nodejs already installed, we can use it, below is the manual installation on top of ubuntu

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs

# above code will install node

# now copy the files into the image by mapping

COPY package.json package.json
COPY package-lock.json package-lock.json
COPY index.js index.js

# finally install all the dependencies

RUN npm install

# define entry point that has to run when the image runs
ENTRYPOINT [ "node", "index.js" ]

# finally containerize the app running below command in terminal
# docker build -t <image_name> <path>
# eg in this case: docker build -t docker_image .