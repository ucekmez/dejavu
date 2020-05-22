FROM python:3.6

WORKDIR /app

RUN apt-get update && apt-get upgrade -y 
RUN apt-get install -y portaudio19-dev libportaudio2 libportaudiocpp0 \
    ffmpeg python-dev libpq-dev
RUN apt-get autoremove && apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /tmp/* /var/tmp/*

RUN pip install -e git+https://github.com/ucekmez/dejavu@v1.2#egg=PyDejavu
RUN git clone https://github.com/ucekmez/dejavu.git
RUN pip install -r /app/dejavu/requirements.txt


WORKDIR /workspace

EXPOSE 8888
ENTRYPOINT ["jupyter", "lab", "--no-browser", "--ip=0.0.0.0", "--port=8888", "--allow-root"]
