#!/bin/sh

PACKAGE_NAME=${1:-lambda.zip}

mkdir -p /packages
mkdir -p /tmp/package

echo ""
echo "> Zipping contents of ${PWD} into /packages/${PACKAGE_NAME}"

pip install \
  --target /tmp/package \
  --requirement ${PWD}/requirements.txt

cp -r ${PWD}/* /tmp/package

cd /tmp/package

zip -r /packages/${PACKAGE_NAME} * .[^.]* -x requirements.txt

echo ""
echo "> Finished packaging lambda into /packages/${PACKAGE_NAME}"

rm -rf /tmp/package*

echo "> Cleaned up /tmp/package"
echo ""
