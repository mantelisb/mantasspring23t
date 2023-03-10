FROM openjdk:19-alpine

# Set the working directory
WORKDIR /app

# Copy the Gradle files
COPY build.gradle settings.gradle gradlew /app/
COPY gradle /app/gradle

# Download and install Gradle
RUN ./gradlew --version

# Copy the project files
COPY . /app

# Build the project
RUN ./gradlew build --scan

# Set the startup command
CMD ["java", "-jar", "build/libs/<your_jar_file_name>.jar"]