# dejavu fork

## Purpose


## Installation

1.  Download Dockerfile and docker-compose.yml files into the same folder


2.  run

```
docker-compose up --build -d
```

## Usage

Open http://localhost:7778 and start experimenting the library using jupyterlab 

jupyter token can be seen by typing

```
docker logs afs
```

create a folder (e.g mp3) and put your training files into it

```python
import warnings
warnings.filterwarnings(action='once')

from dejavu import Dejavu
from dejavu.recognize import FileRecognizer

djv = Dejavu(dburl='postgresql+psycopg2://ugur:123123@db/db')

djv.fingerprint_directory('/workspace/data/mp3', extensions=['mp3'], nprocesses=8)

```

then test it by typing

```python
song = djv.recognize(FileRecognizer, 'test.mp3')
```


## Extra :

### how to convert any music file to mp3

```python
from pydub import AudioSegment

audio = AudioSegment.from_file("somefile.wav", format='wav')
audio.export("result.mp3", format="mp3")
```
