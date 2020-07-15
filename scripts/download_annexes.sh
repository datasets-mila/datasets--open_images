#!/bin/bash

# this script is meant to be used with 'datalad run'

# Clean-up v5 files
for file in "train/train-annotations-bbox.csv" \
            "train/challenge-2018-train-vrd.csv" \
            "validation-annotations-vrd.csv" \
            "test-annotations-vrd.csv" \
            "challenge-2018-relationships-description.csv" \
            "challenge-2018-attributes-description.csv" \
            "challenge-2018-relationship-triplets.csv"
do
	git-annex drop ${file}
	git rm ${file}
done

git commit -m "Remove v5 files"

for file_url in "https://storage.googleapis.com/openimages/v6/oidv6-train-annotations-bbox.csv oidv6-train-annotations-bbox.csv" \
                "https://storage.googleapis.com/openimages/v5/validation-annotations-bbox.csv validation-annotations-bbox.csv" \
                "https://storage.googleapis.com/openimages/v5/test-annotations-bbox.csv test-annotations-bbox.csv" \
                "https://storage.googleapis.com/openimages/v5/train-masks/train-masks-0.zip train-masks/train-masks-0.zip" \
                "https://storage.googleapis.com/openimages/v5/train-masks/train-masks-1.zip train-masks/train-masks-1.zip" \
                "https://storage.googleapis.com/openimages/v5/train-masks/train-masks-2.zip train-masks/train-masks-2.zip" \
                "https://storage.googleapis.com/openimages/v5/train-masks/train-masks-3.zip train-masks/train-masks-3.zip" \
                "https://storage.googleapis.com/openimages/v5/train-masks/train-masks-4.zip train-masks/train-masks-4.zip" \
                "https://storage.googleapis.com/openimages/v5/train-masks/train-masks-5.zip train-masks/train-masks-5.zip" \
                "https://storage.googleapis.com/openimages/v5/train-masks/train-masks-6.zip train-masks/train-masks-6.zip" \
                "https://storage.googleapis.com/openimages/v5/train-masks/train-masks-7.zip train-masks/train-masks-7.zip" \
                "https://storage.googleapis.com/openimages/v5/train-masks/train-masks-8.zip train-masks/train-masks-8.zip" \
                "https://storage.googleapis.com/openimages/v5/train-masks/train-masks-9.zip train-masks/train-masks-9.zip" \
                "https://storage.googleapis.com/openimages/v5/train-masks/train-masks-a.zip train-masks/train-masks-a.zip" \
                "https://storage.googleapis.com/openimages/v5/train-masks/train-masks-b.zip train-masks/train-masks-b.zip" \
                "https://storage.googleapis.com/openimages/v5/train-masks/train-masks-c.zip train-masks/train-masks-c.zip" \
                "https://storage.googleapis.com/openimages/v5/train-masks/train-masks-d.zip train-masks/train-masks-d.zip" \
                "https://storage.googleapis.com/openimages/v5/train-masks/train-masks-e.zip train-masks/train-masks-e.zip" \
                "https://storage.googleapis.com/openimages/v5/train-masks/train-masks-f.zip train-masks/train-masks-f.zip" \
                "https://storage.googleapis.com/openimages/v5/train-annotations-object-segmentation.csv train-annotations-object-segmentation.csv" \
                "https://storage.googleapis.com/openimages/v5/validation-masks/validation-masks-0.zip validation-masks/validation-masks-0.zip" \
                "https://storage.googleapis.com/openimages/v5/validation-masks/validation-masks-1.zip validation-masks/validation-masks-1.zip" \
                "https://storage.googleapis.com/openimages/v5/validation-masks/validation-masks-2.zip validation-masks/validation-masks-2.zip" \
                "https://storage.googleapis.com/openimages/v5/validation-masks/validation-masks-3.zip validation-masks/validation-masks-3.zip" \
                "https://storage.googleapis.com/openimages/v5/validation-masks/validation-masks-4.zip validation-masks/validation-masks-4.zip" \
                "https://storage.googleapis.com/openimages/v5/validation-masks/validation-masks-5.zip validation-masks/validation-masks-5.zip" \
                "https://storage.googleapis.com/openimages/v5/validation-masks/validation-masks-6.zip validation-masks/validation-masks-6.zip" \
                "https://storage.googleapis.com/openimages/v5/validation-masks/validation-masks-7.zip validation-masks/validation-masks-7.zip" \
                "https://storage.googleapis.com/openimages/v5/validation-masks/validation-masks-8.zip validation-masks/validation-masks-8.zip" \
                "https://storage.googleapis.com/openimages/v5/validation-masks/validation-masks-9.zip validation-masks/validation-masks-9.zip" \
                "https://storage.googleapis.com/openimages/v5/validation-masks/validation-masks-a.zip validation-masks/validation-masks-a.zip" \
                "https://storage.googleapis.com/openimages/v5/validation-masks/validation-masks-b.zip validation-masks/validation-masks-b.zip" \
                "https://storage.googleapis.com/openimages/v5/validation-masks/validation-masks-c.zip validation-masks/validation-masks-c.zip" \
                "https://storage.googleapis.com/openimages/v5/validation-masks/validation-masks-d.zip validation-masks/validation-masks-d.zip" \
                "https://storage.googleapis.com/openimages/v5/validation-masks/validation-masks-e.zip validation-masks/validation-masks-e.zip" \
                "https://storage.googleapis.com/openimages/v5/validation-masks/validation-masks-f.zip validation-masks/validation-masks-f.zip" \
                "https://storage.googleapis.com/openimages/v5/validation-annotations-object-segmentation.csv validation-annotations-object-segmentation.csv" \
                "https://storage.googleapis.com/openimages/v5/test-masks/test-masks-0.zip test-masks/test-masks-0.zip" \
                "https://storage.googleapis.com/openimages/v5/test-masks/test-masks-1.zip test-masks/test-masks-1.zip" \
                "https://storage.googleapis.com/openimages/v5/test-masks/test-masks-2.zip test-masks/test-masks-2.zip" \
                "https://storage.googleapis.com/openimages/v5/test-masks/test-masks-3.zip test-masks/test-masks-3.zip" \
                "https://storage.googleapis.com/openimages/v5/test-masks/test-masks-4.zip test-masks/test-masks-4.zip" \
                "https://storage.googleapis.com/openimages/v5/test-masks/test-masks-5.zip test-masks/test-masks-5.zip" \
                "https://storage.googleapis.com/openimages/v5/test-masks/test-masks-6.zip test-masks/test-masks-6.zip" \
                "https://storage.googleapis.com/openimages/v5/test-masks/test-masks-7.zip test-masks/test-masks-7.zip" \
                "https://storage.googleapis.com/openimages/v5/test-masks/test-masks-8.zip test-masks/test-masks-8.zip" \
                "https://storage.googleapis.com/openimages/v5/test-masks/test-masks-9.zip test-masks/test-masks-9.zip" \
                "https://storage.googleapis.com/openimages/v5/test-masks/test-masks-a.zip test-masks/test-masks-a.zip" \
                "https://storage.googleapis.com/openimages/v5/test-masks/test-masks-b.zip test-masks/test-masks-b.zip" \
                "https://storage.googleapis.com/openimages/v5/test-masks/test-masks-c.zip test-masks/test-masks-c.zip" \
                "https://storage.googleapis.com/openimages/v5/test-masks/test-masks-d.zip test-masks/test-masks-d.zip" \
                "https://storage.googleapis.com/openimages/v5/test-masks/test-masks-e.zip test-masks/test-masks-e.zip" \
                "https://storage.googleapis.com/openimages/v5/test-masks/test-masks-f.zip test-masks/test-masks-f.zip" \
                "https://storage.googleapis.com/openimages/v5/test-annotations-object-segmentation.csv test-annotations-object-segmentation.csv" \
                "https://storage.googleapis.com/openimages/v6/oidv6-train-annotations-vrd.csv oidv6-train-annotations-vrd.csv" \
                "https://storage.googleapis.com/openimages/v6/oidv6-validation-annotations-vrd.csv oidv6-validation-annotations-vrd.csv" \
                "https://storage.googleapis.com/openimages/v6/oidv6-test-annotations-vrd.csv oidv6-test-annotations-vrd.csv" \
                "https://storage.googleapis.com/openimages/v5/train-annotations-human-imagelabels-boxable.csv train-annotations-human-imagelabels-boxable.csv" \
                "https://storage.googleapis.com/openimages/v5/validation-annotations-human-imagelabels-boxable.csv validation-annotations-human-imagelabels-boxable.csv" \
                "https://storage.googleapis.com/openimages/v5/test-annotations-human-imagelabels-boxable.csv test-annotations-human-imagelabels-boxable.csv" \
                "https://storage.googleapis.com/openimages/2018_04/train/train-images-boxable-with-rotation.csv train/train-images-boxable-with-rotation.csv" \
                "https://storage.googleapis.com/openimages/2018_04/validation/validation-images-with-rotation.csv validation/validation-images-with-rotation.csv" \
                "https://storage.googleapis.com/openimages/2018_04/test/test-images-with-rotation.csv test/test-images-with-rotation.csv" \
                "https://storage.googleapis.com/openimages/v5/class-descriptions-boxable.csv class-descriptions-boxable.csv" \
                "https://storage.googleapis.com/openimages/v6/oidv6-relationships-description.csv oidv6-relationships-description.csv" \
                "https://storage.googleapis.com/openimages/v6/oidv6-attributes-description.csv oidv6-attributes-description.csv" \
                "https://storage.googleapis.com/openimages/v6/oidv6-relationship-triplets.csv oidv6-relationship-triplets.csv" \
                "https://storage.googleapis.com/openimages/v5/classes-segmentation.txt classes-segmentation.txt" \
                "https://storage.googleapis.com/localized-narratives/annotations/open_images_train_v6_localized_narratives-00000-of-00010.jsonl localized-narratives/annotations/open_images_train_v6_localized_narratives-00000-of-00010.jsonl" \
                "https://storage.googleapis.com/localized-narratives/annotations/open_images_train_v6_localized_narratives-00001-of-00010.jsonl localized-narratives/annotations/open_images_train_v6_localized_narratives-00001-of-00010.jsonl" \
                "https://storage.googleapis.com/localized-narratives/annotations/open_images_train_v6_localized_narratives-00002-of-00010.jsonl localized-narratives/annotations/open_images_train_v6_localized_narratives-00002-of-00010.jsonl" \
                "https://storage.googleapis.com/localized-narratives/annotations/open_images_train_v6_localized_narratives-00003-of-00010.jsonl localized-narratives/annotations/open_images_train_v6_localized_narratives-00003-of-00010.jsonl" \
                "https://storage.googleapis.com/localized-narratives/annotations/open_images_train_v6_localized_narratives-00004-of-00010.jsonl localized-narratives/annotations/open_images_train_v6_localized_narratives-00004-of-00010.jsonl" \
                "https://storage.googleapis.com/localized-narratives/annotations/open_images_train_v6_localized_narratives-00005-of-00010.jsonl localized-narratives/annotations/open_images_train_v6_localized_narratives-00005-of-00010.jsonl" \
                "https://storage.googleapis.com/localized-narratives/annotations/open_images_train_v6_localized_narratives-00006-of-00010.jsonl localized-narratives/annotations/open_images_train_v6_localized_narratives-00006-of-00010.jsonl" \
                "https://storage.googleapis.com/localized-narratives/annotations/open_images_train_v6_localized_narratives-00007-of-00010.jsonl localized-narratives/annotations/open_images_train_v6_localized_narratives-00007-of-00010.jsonl" \
                "https://storage.googleapis.com/localized-narratives/annotations/open_images_train_v6_localized_narratives-00008-of-00010.jsonl localized-narratives/annotations/open_images_train_v6_localized_narratives-00008-of-00010.jsonl" \
                "https://storage.googleapis.com/localized-narratives/annotations/open_images_train_v6_localized_narratives-00009-of-00010.jsonl localized-narratives/annotations/open_images_train_v6_localized_narratives-00009-of-00010.jsonl"
do
        echo ${file_url} | git-annex addurl -c annex.largefiles=anything --raw --batch --with-files
done

echo * */* */*/* | xargs ls -pd --group-directories-first | grep -vE "images/|scripts/|md5sums|/$" | xargs md5sum > md5sums
