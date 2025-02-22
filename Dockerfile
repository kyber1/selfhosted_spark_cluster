FROM quay.io/jupyter/base-notebook:a374cab4fcb6

# Switch to root user to install required packages
USER root

# Install Java (required for Spark) and PySpark with Spark 3.3.0
RUN apt-get update && apt-get install -y openjdk-11-jre-headless && \
    pip install pyspark==3.3.0 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to jovyan (default user for Jupyter)
USER jovyan

