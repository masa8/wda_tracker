FROM ubuntu:latest
SHELL ["/bin/bash", "-c"]

# Install necessary packages
RUN apt-get update && \
    apt-get install -y wget bzip2 ca-certificates curl git build-essential python3-dev cmake

# Download and install Miniconda with Python 3.7
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && chmod +x /tmp/miniconda.sh && /tmp/miniconda.sh -b -p /opt/conda && rm /tmp/miniconda.sh && /opt/conda/bin/conda  clean -a && ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && echo "conda activate base" >> ~/.bashrc

# Create a Conda environment called myenv with Python 3.7
RUN source /opt/conda/etc/profile.d/conda.sh && conda create -y --name myenv python=3.7

# Activate the myenv environment
RUN echo "conda activate myenv" >> ~/.bashrc
ENV PATH=/opt/conda/envs/myenv/bin:$PATH

# Set the working directory
WORKDIR /app

# Copy your application code to the container
COPY . /app

# Install dependencies from requirements.txt
RUN source /opt/conda/etc/profile.d/conda.sh && conda activate myenv && conda install -y -c conda-forge numpy && conda install cython && pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt


#RUN pip install --upgrade cython

#RUN pip install --no-cache-dir -r requirements.txt


RUN source /opt/conda/etc/profile.d/conda.sh && conda activate myenv && conda install -y -c anaconda mkl_random
RUN source /opt/conda/etc/profile.d/conda.sh && conda activate myenv && conda install -y -c conda-forge mkl-service
RUN source /opt/conda/etc/profile.d/conda.sh && conda activate myenv && conda install -y -c intel mkl_fft

ENTRYPOINT ["/bin/bash", "-c", "source ~/.bashrc && exec \"$@\""]


