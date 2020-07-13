#!/bin/bash

# this script is meant to be used with 'datalad run'

pip install -r scripts/requirements_download_images.txt --upgrade
if [ $? -ne 0 ]; then
   echo "Failed to install requirements: pip install: $?"
   return $?
fi

datalad create -d . images/

cd images/

for subset in "train" "validation" "test"
do
	mkdir -p ${subset}/
	files=`aws s3 ls s3://open-images-dataset/tar/ --no-sign-request | grep -o "${subset}.*"`
	for file in ${files[*]}
	do
		echo "https://open-images-dataset.s3.amazonaws.com/tar/${file} ${subset}/${file}" | git-annex addurl -c annex.largefiles=anything --raw --batch --with-files
	done
done

md5sum */* > md5sums
