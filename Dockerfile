FROM python:3.8-alpine

WORKDIR /app

# copy the requirements file and its content (the generated packages and dependencies) into the app folder of the image
COPY requirements.txt requirements.txt

# installs all the dependencies defined in the requirements.txt file into our application within the container
RUN pip3 install -r requirements.txt

# copy the rest of the files into the app folder
COPY . .

# this is the command that runs the application in the container
# ENTRYPOINT [ "python" ]

# appends the list of parameters to the EntryPoint parameter to perform the command that runs the application
# by default, flask listens on localhost only which means it won't be accessible from outside the container
# configure it to listen on 0.0.0.0 which allows it to accept connections from any IP address
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0" ]