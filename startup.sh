#/bin/bash

git clone --branch runpod_classify --single-branch --depth 1 https://adamczyha:${apikey_github}@github.com/adamczycha/fineweb2_bis.git 

cd fineweb2_bis

set -a
source ./classification_config
set +a

cp -a $MODEL_CHECKPOINT .

python -m pip install -r requirements.txt

python classify.py
if [-n "$RUNPOD_POD_ID"]; then 
    runpodctl remove pod $RUNPOD_POD_ID
fi
