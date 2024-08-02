FROM tomcat:10-jdk21-openjdk-slim

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Download PostgreSQL JDBC driver
ADD https://jdbc.postgresql.org/download/postgresql-42.2.23.jar /usr/local/tomcat/lib/

# Copy the WAR file into the Tomcat webapps directory
COPY 25250.war /usr/local/tomcat/webapps/ROOT.war

# Expose the port for Tomcat and your local PostgreSQL database
EXPOSE 8080 5432

# Start Tomcat server
CMD ["catalina.sh", "run"]
