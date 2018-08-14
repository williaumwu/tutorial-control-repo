#!/bin/bash

export TEST_DIR=${TEST_DIR:=/usr/src/app}

echo "This script assumes python onbuild that places code in /usr/src/app"

if ! [ "$(ls -A $TEST_DIR)" ]; then
    echo "$TEST_DIR is Empty"
    echo "No tests are run"
    exit 0
fi

pip freeze |grep pytest 
rc=$?

if [[ $rc != 0 ]]
   then 
       echo "Will be installing pytest"
       pip install pytest 
fi

cd $TEST_DIR
pytest

rc=$?

if [[ $rc != 0 ]]
   then 
       echo "pytest failed!"
       exit 1
fi


if [ "$(ls -A $TEST_DIR)" ]; then
     echo "Test directory $TEST_DIR is not Empty"
else
    echo "$TEST_DIR is Empty"
    exit 0
fi
