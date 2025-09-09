# Stage 1: Use a known good OpenJDK image to get the JDK 21 runtime
FROM eclipse-temurin:21-jre-jammy as builder

# Stage 2: Use the slim Python base image for ARM64 architecture
FROM arm64v8/python:3.11-slim-bookworm

# Copy the JDK from the 'builder' stage into the final image
COPY --from=builder /opt/java/openjdk /usr/local/openjdk-21

# Set environment variables for PySpark to use the newly copied JDK 21
ENV JAVA_HOME="/usr/local/openjdk-21"
ENV PATH="$PATH:$JAVA_HOME/bin"

# Install system dependencies
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Install PySpark, Jupyter, and other necessary Python libraries
RUN pip install pyspark==3.5.0 \
    pandas==2.0.0 \
    jupyter==1.0.0

# Download the MySQL JDBC driver from a more reliable location
RUN wget --no-check-certificate https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-8.0.33.tar.gz -P /tmp && tar -xzf /tmp/mysql-connector-j-8.0.33.tar.gz -C /usr/local/lib/python3.11/site-packages/pyspark/jars --strip-components=1 && rm /tmp/mysql-connector-j-8.0.33.tar.gz

# Set the SPARK_CLASSPATH to include the JDBC driver
ENV SPARK_CLASSPATH=/usr/local/lib/python3.11/site-packages/pyspark/jars/mysql-connector-j-8.0.33.jar

# Set a parent working directory so that the working_dir in docker-compose.yml can take over
WORKDIR /home/jovyan/etl

# Expose the port for Jupyter Notebook
EXPOSE 8888

# Command to start Jupyter Notebook
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
