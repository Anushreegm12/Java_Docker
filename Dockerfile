# Use OpenJDK as the base image
FROM openjdk:11

# Set the working directory inside the container
WORKDIR /app

# Copy all Java source files to the working directory
COPY . /app

# Compile the Java application
RUN javac HelloWorld.java

# Run the Java application
CMD ["java", "HelloWorld"]
