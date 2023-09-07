FROM amazoncorretto:17-alpine3.18

RUN mkdir -p /workdir
WORKDIR /workdir

# Install wget
#RUN apk add --no-cache wget

# Create directory for AppleCommander
RUN mkdir -p /opt/appleII

# Download AppleCommander into /opt/appleII
RUN wget https://github.com/AppleCommander/AppleCommander/releases/download/1.8.0/AppleCommander-ac-1.8.0.jar -O /opt/appleII/AppleCommander-ac-1.8.0.jar

# Add an alias for the ac command
# Note: The alias command is not persistent between different RUN commands, so we will add it to the shell configuration file
#RUN echo 'alias ac="java -jar /opt/appleII/AppleCommander-ac-1.8.0.jar"' >> ~/.ashrc

# Create a script to run the 'ac' command
RUN echo '#!/bin/sh' > /usr/local/bin/ac
RUN echo 'java -jar /opt/appleII/AppleCommander-ac-1.8.0.jar "$@"' >> /usr/local/bin/ac
RUN chmod +x /usr/local/bin/ac

# Set the default command to run the 'ac' script
CMD [ "ac" ]
