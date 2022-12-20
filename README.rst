###################
Open Images Dataset
###################

`<https://storage.googleapis.com/openimages/web/factsfigures.html>`_

*You are viewing the description of the latest version of Open Images (V6 -
released Feb 2020), if you would like to view the description of previous
versions, please select it here:*

**************************
Overview of Open Images V6
**************************

Open Images is a dataset of ~9M images annotated with image-level labels,
object bounding boxes, object segmentation masks, visual relationships, and
localized narratives:

-  It contains a total of 16M bounding boxes for 600 object classes on 1.9M
   images, making it the *largest existing dataset with object location
   annotations*. The boxes have been largely manually drawn by professional
   annotators to ensure accuracy and consistency. The images are very diverse
   and often contain complex scenes with several objects (8.3 per image on
   average).
-  Open Images also offers visual relationship annotations, indicating pairs of
   objects in particular relations (e.g. "woman playing guitar", "beer on
   table"), object properties (e.g. "table is wooden"), and human actions (e.g.
   "woman is jumping"). In total it has 3.3M annotations from 1,466 distinct
   relationship triplets.
-  In V5 we added segmentation masks for 2.8M object instances in 350 classes.
   Segmentation masks mark the outline of objects, which characterizes their
   spatial extent to a much higher level of detail.
-  In V6 we added 675k localized narratives: multimodal descriptions of images
   consisting of synchronized voice, text, and mouse traces over the objects
   being described. (Note we originally launched localized narratives only on
   train in V6, but since July 2020 we also have validation and test covered.)
-  Finally, the dataset is annotated with 59.9M image-level labels spanning
   19,957 classes.

We believe that having a single dataset with unified annotations for image
classification, object detection, visual relationship detection, instance
segmentation, and multimodal image descriptions will enable to study these
tasks jointly and stimulate progress towards genuine scene understanding.

********************
Open Images Extended
********************

Open Images Extended is a collection of sets that complement the core Open
Images Dataset with additional images and/or annotations. You can read more
about this in the `Extended section <extended.html>`__. The rest of this page
describes the core Open Images Dataset, without Extensions.

************
Publications
************

The following paper describes Open Images V4 in depth: from the data collection
and annotation to detailed statistics about the data and evaluation of models
trained on it. If you use the Open Images dataset in your work (also V5 and
V6), please cite this article.

::

   @article{OpenImages,
     author = {Alina Kuznetsova and Hassan Rom and Neil Alldrin and Jasper Uijlings and Ivan Krasin and Jordi Pont-Tuset and Shahab Kamali and Stefan Popov and Matteo Malloci and Alexander Kolesnikov and Tom Duerig and Vittorio Ferrari},
     title = {The Open Images Dataset V4: Unified image classification, object detection, and visual relationship detection at scale},
     year = {2020},
     journal = {IJCV}
   }

The next paper describes the technique used to annotate instance segmentations
in Open Images. If you use the segmentations, please cite this article too.

::

   @inproceedings{OpenImagesSegmentation,
     author = {Rodrigo Benenson and Stefan Popov and Vittorio Ferrari},
     title = {Large-scale interactive object segmentation with human annotators},
     booktitle = {CVPR},
     year = {2019}
   }

The following paper describes Localized Narratives, please cite this article
too if you use them in your research.

::

   @inproceedings{OpenImagesLocNarr,
     author    = {Jordi Pont-Tuset and Jasper Uijlings and Soravit Changpinyo and Radu Soricut and Vittorio Ferrari},
     title     = {Connecting Vision and Language with Localized Narratives},
     booktitle = {ECCV},
     year      = {2020}
   }

Please also consider citing this general reference to the dataset:

::

   @article{OpenImages2,
     title={OpenImages: A public dataset for large-scale multi-label and multi-class image classification.},
     author={Krasin, Ivan and Duerig, Tom and Alldrin, Neil and Ferrari, Vittorio and Abu-El-Haija, Sami and Kuznetsova, Alina and Rom, Hassan and Uijlings, Jasper and Popov, Stefan and Kamali, Shahab and Malloci, Matteo and Pont-Tuset, Jordi and Veit, Andreas and Belongie, Serge and Gomes, Victor and Gupta, Abhinav and Sun, Chen and Chechik, Gal and Cai, David and Feng, Zheyun and Narayanan, Dhyanesh and Murphy, Kevin},
     journal={Dataset available from https://storage.googleapis.com/openimages/web/index.html},
     year={2017}
   }

************************
Complexity and Diversity
************************

The plots above show the distributions of object centers in normalized image
coordinates for various sets of Open Images and other related datasets. The
Open Images Train set, which contains most of the data, and Challenge sets show
a rich and diverse distribution of a complexity in a similar ballpark to the
COCO dataset. This is also confirmed when considering the number of objects per
image and their area distribution (plots below). While we improved the density
of annotation in the smaller validation and test sets from V4 to V5, their
center distribution is simpler and closer to PASCAL 2012. We recommend users to
report results on the Challenge set, which offers the hardest performance test
for object detectors. We thank Ross Girshick for suggesting this type of
visualizations and for correcting the figure in their LVIS paper, which
displayed a plot for the validation set without knowing that it was not
representative of the whole dataset, and included an intensity scaling artifact
that exaggerated its peakiness.

Data organization
=================

The dataset is split into a training set (9,011,219 images), a validation set
(41,620 images), and a test set (125,436 images). The images are annotated with
image-level labels, object bounding boxes, object segmentation masks, visual
relationships, and localized narratives as described below.

Image-level labels
==================

Table 1 shows an overview of the image-level labels in all splits of the
dataset. All images have machine generated image-level labels automatically
generated by a computer vision model similar to `Google Cloud Vision API
<https://cloud.google.com/vision/>`__. These automatically generated labels
have a substantial false positive rate.

Table 1: Image-level labels.

+-----------+-----------+-----------+-----------+-----------+-----------+
|           | Train     | V         | Test      | # Classes | #         |
|           |           | alidation |           |           | Trainable |
|           |           |           |           |           | Classes   |
+===========+===========+===========+===========+===========+===========+
| Images    | 9,011,219 | 41,620    | 125,436   | -         | -         |
+-----------+-----------+-----------+-----------+-----------+-----------+
| Machine-  | 16        | 681,179   | 2,061,177 | 15,387    | 9,034     |
| Generated | 4,819,642 |           |           |           |           |
| Labels    |           |           |           |           |           |
+-----------+-----------+-----------+-----------+-----------+-----------+
| Human     | 5         | 595,339   | 1,799,883 | 19,957    | 9,605     |
| -Verified | 7,524,352 | pos:      | pos:      |           |           |
| Labels    | pos:      | 367,263   | 1,110,124 |           |           |
|           | 1         | neg:      | neg:      |           |           |
|           | 9,856,086 | 228,076   | 689,759   |           |           |
|           | neg:      |           |           |           |           |
|           | 3         |           |           |           |           |
|           | 7,668,266 |           |           |           |           |
+-----------+-----------+-----------+-----------+-----------+-----------+

Moreover, the validation and test sets, as well as part of the training set
have human-verified image-level labels. Most verifications were done with
in-house annotators at Google. A smaller part was done by crowd-sourcing from
Image Labeler: `Crowdsource app
<http://play.google.com/store/apps/details?id=com.google.android.apps.village.boond>`__,
`g.co/imagelabeler <http://g.co/imagelabeler>`__. This verification process
practically eliminates false positives (but not false negatives: some labels
might be missing from an image). The resulting labels are largely correct and
we recommend to use these for training computer vision models. Multiple
computer vision models were used to generate the samples (not just the one used
for the machine-generated labels) which is why the vocabulary is significantly
expanded (#classes column in Table 1).

As a result of our annotation process, each image is annotated both with
verified positive image-level labels, indicating some object classes are
present, **and** with verified negative image-level labels, indicating some
classes are absent. All other classes which are not explicitly marked as
positive or negative for an image are not annotated. The verified negative
labels are reliable and can be used during training and evaluation of image
classifiers.

Overall, there are 19,958 distinct `classes with image-level labels
<https://storage.googleapis.com/openimages/v6/oidv6-classes.txt>`__.  Note that
this number is slightly higher than the number of human-verified labels in
Table 1. The reason is that there are a small number of labels in the
machine-generated set that do not appear in the human-verified set. Trainable
classes are those with at least 100 positive human-verifications in the V6
training set. Based on this definition, `9,605 classes are considered trainable
<https://storage.googleapis.com/openimages/v6/oidv6-classes-trainable.txt>`__
and machine-generated labels cover 9,034 of these.

Bounding boxes
==============

Table 2 shows an overview of the bounding box annotations in all splits of the
dataset, which span `600 object classes
<https://storage.googleapis.com/openimages/v5/class-descriptions-boxable.csv>`__.
These offer a broader range than those in the ILSVRC and COCO detection
challenges, including new objects such as "fedora" and "snowman".

Table 2: Boxes.

====== ========== ========== ======= =========
\      Train      Validation Test    # Classes
====== ========== ========== ======= =========
Images 1,743,042  41,620     125,436 -
Boxes  14,610,229 303,980    937,327 600
====== ========== ========== ======= =========

For the training set, we annotated boxes in 1.74M images, for the available
positive human-verified image-level labels. We focused on the most specific
labels. For example, if an image has labels {car, limousine, screwdriver}, we
annotated boxes for limousine and screwdriver. For each positive label in an
image, we *exhaustively annotated every instance of that object class in the
image* (but see below for group cases). We provide 14.6M bounding boxes. On
average there are 8.4 boxed objects per image. 90% of the boxes were manually
drawn by professional annotators at Google using the efficient extreme clicking
interface [1] (new in V6: the actual four extreme points defining each box are
released for train). We produced the remaining 10% semi-automatically using an
enhanced version of the method in [2]. These boxes have been human verified to
have IoU>0.7 with a perfect box on the object, and in practice they are
accurate (mean IoU ~0.77, see Sect. 4.2 of [3]). We have drawn bounding boxes
for `human body parts and the class "Mammal"
<https://storage.googleapis.com/openimages/2018_04/class-ids-human-body-parts-and-mammal.txt>`__
only for `95,335 images
<https://storage.googleapis.com/openimages/2018_04/train/train-image-ids-with-human-parts-and-mammal-boxes.txt>`__,
due to the overwhelming number of instances (1,327,596 on the 95,335 images).
This list of images enables using the data correctly during training of object
detectors (as there might be a positive image label for a human body part, and
yet no boxes). Finally, we drew a single box around groups of objects (e.g., a
bed of flowers or a crowd of people) if they had more than 5 instances which
were heavily occluding each other and were physically touching (we marked these
boxes with the attribute "group-of").

For the validation and test sets, we provide exhaustive box annotation for all
object instances, for all available positive image-level labels (again, except
for "groups-of"). All boxes were manually drawn. We deliberately tried to
annotate boxes at the most specific level in our `semantic hierarchy
<https://storage.googleapis.com/openimages/2018_04/bbox_labels_600_hierarchy_visualizer/circle.html>`__
as possible. On average, there are 7.4 boxes per image in the validation and
test sets. For Open Images V5, we improved the annotation density, which now
comes close to the density in the training set. This ensures more precise
evaluation of object detection models. In contrast to the training set, on the
validation and test sets we annotated human body parts on all images for which
we have a positive label.

We emphasize that the images are annotated both human-verified positive **and**
negative labels (see `section above <#image_level_labels>`__).  Importantly,
the negative image-level labels can be used during training of object
detectors, e.g. for hard-negative mining. Moreover, they can also be used
during evaluation, as detections of a class annotated as negative (absent) in
the ground-truth can be reliably counted as false-positives. In our Open Images
Challenge `website <challenge2019.html>`__ we present an `evaluation metric
<evaluation.html>`__ that fully uses the image-level labels to fairly evaluate
detection models.

In all splits (train, val, test), annotators also marked a set of attributes
for each box, e.g. indicating whether that object is occluded (see the full
description in the `download <download.html#attributes>`__ section).

Object segmentations
====================

Table 3 shows an overview of the object segmentation annotations in all splits
of the dataset. These annotations cover a subset of 350 classes from the 600
boxed classes. These offer a broader range of categories than Cityscapes or
COCO, and cover more images and instances than ADE20k. The segmentations spread
over a subset of the images with bounding boxes (Table 2).

Table 3: Instance segmentation masks.

============== ========= ========== ====== =========
\              Train     Validation Test   # Classes
============== ========= ========== ====== =========
Images         944,037   13,524     40,386 -
Instance masks 2,686,666 24,730     74,102 350
============== ========= ========== ====== =========

For the training set we annotated 2.7M instance masks, starting from the
available bounding boxes. The masks cover 350 classes and are spread over 944k
images. On average there are 2.8 segmented instances per image. The
segmentation masks on the training set have been produced by a state-of-the-art
interactive segmentation process [4], where professional human annotators
iteratively correct the output of a segmentation neural network. This is more
efficient than manual drawing alone, while at the same time delivering accurate
masks (mIoU 84% [4]).

We selected the 350 classes to annotate with segmentation masks based on the
following criteria: (1) whether the class exhibits one coherent appearance over
which a policy could be defined (e.g. "hiking equipment" is rather
ill-defined); (2) whether a clear annotation policy can be defined (e.g. which
pixels belong to a nose?); and (3) whether we expect current segmentation
neural networks to be able to capture the shape of the class adequately (e.g.
jellyfish contains thin structures that are hard for state-of-the-art models).
We have put particular effort into ensuring consistent annotations across
different objects (e.g., all cat masks include their tail; bags carried by
camels or persons, are included in their mask).

We annotated all boxed instances of these 350 classes on the training split
that fulfill the following criteria: (1) the object size is larger than 40x80
or 80x40 pixels; (2) the object boundaries can be confidently determined by the
annotator (e.g. blurry or very dark instances are skipped); (3) the
bounding-box contains a single real object (i.e. does not have any of the
IsGroupOf, IsDepiction, IsInside attributes). A few of the 350 classes have a
disproportionately large number of instances.  To better spread the annotation
effort we capped four categories: "clothing" to 441k instances, "person" to
149k, "woman" to 117k, "man" to 114k. In total we annotated segmentation masks
for 769k instances of "person"+"man"+"woman"+"boy"+"girl"+"human body". All
other classes are annotated without caps, using only the two criteria above.

For the validation and test splits we created 99k masks spread over 54k images.
These have been annotated with a purely manual free-painting tool and with a
strong focus on quality. They are near-perfect (self-consistency 90% mIoU [4])
and capture even fine details of complex object boundaries (e.g. spiky flowers
and thin structures in man-made objects). For the validation and test splits we
limited these annotation to a maximum of 600 instances per class (per split),
and applied the same instance selection criteria as in the training split
(minimal size, unambiguous boundary, single real object). On average over all
instances, both our training and validation+test annotations offer more
accurate object boundaries than the polygon annotations provided by most
existing datasets [4].

Please note that instances without a mask remain covered by their corresponding
bounding boxes, and thus can be appropriately handled during training and
evaluation of segmentation models.

We emphasize that the images are annotated both human-verified positive **and**
negative labels. The negative image-level labels can be used during training of
segmentation models, e.g. for hard-negative mining. Moreover, they can also be
used during evaluation, as we do for the `Open Images Challenge
<evaluation.html>`__.

Visual relationships
====================

Table 4 shows an overview of the visual relationship annotations in the
dataset.

Table 4: Relationships and attributes.

+-----------+-----------+-----------+-----------+-----------+-----------+
|           | Train     | V         | Test      | #         | # Classes |
|           |           | alidation |           | Distinct  |           |
|           |           |           |           | rel       |           |
|           |           |           |           | ationship |           |
|           |           |           |           | triplets  |           |
+===========+===========+===========+===========+===========+===========+
| Rel       | 3,174,291 | 27,243    | 82,746    | 1,466     | 288       |
| ationship | non-attr: | non-attr: | non-attr: | non-attr: |           |
| triplets  | 348,560   | 4,951     | 14,403    | 1,384     |           |
+-----------+-----------+-----------+-----------+-----------+-----------+

In our notation, a pair of objects connected by a relationship forms a triplet
(e.g. "beer on table"). Visual attributes are also represented as triplets,
where an object in connected with an attribute using the relationship *is*. We
annotate two types of attributes: physical object properties (e.g. "table is
wooden" or "handbag is made of leather") and human actions (e.g. "man is
jumping" or "woman is standing"). We initially selected 2019 possible triplets
based on existing bounding box annotations. The 1,466 of them that have at
least one instance in the training split form the final set of visual
relationships/attributes triplets. In total, we annotated more than 3.1M
instances of these triplets on the training split, involving 288 different
object classes and 15 attributes. These include human-object relationships
(e.g. "woman playing guitar", "man holding microphone"), object-object
relationships (e.g. "beer on table", "dog inside car"), human-human
relationships (e.g. "two men shake hands"), object attributes (e.g. "table is
wooden"), and human actions (e.g. "man is jumping").

Visual relationship annotations are exhaustive (except human-human
relationships, see next), meaning that for each image that can potentially
contain a relationship triplet (i.e. that contains the objects involved in that
triplet), we provide annotations exhaustively listing all positive triplets
instances in that image. For example, for "woman playing guitar" in an image,
we list all pairs of ("woman","guitar") that are in the relationship "playing"
in that image.  All other pairs of ("woman","guitar") in that image are
reliable negative examples for the "playing" relationship. Further, human-human
relationships were exhaustively annotated for the images that have the
corresponding positively verified image-level label for the relationship (e.g.,
if an image has positively verified image-level label "hug", all pairs of
people hugging would be annotated).

Finally, we annotated some zero-shot triplets: 61 distinct triplets in the
validation and test sets do not have samples in the train set (and some
triplets in train set do not have corresponding triplets on validation and test
sets). Examples of these triplets are: "girl holds dumbbell", "pizza on a
cutting board", or "dog on a washing machine".

We emphasize that the images are annotated both with human-verified positive
**and** negative image-level labels (see `section above
<#image_level_labels>`__). Importantly, the negative image-level labels can be
used during training of visual relationship detectors: if any of the two object
classes in a relationship triplet is marked as a negative label in our
ground-truth, then all detections of that triplet are false-positives. The same
can be done during evaluation, as we did for our official `Open Images
Challenge metric <evaluation.html>`__.

Localized narratives
====================

Localized narratives are multimodal descriptions of images consisting of
synchronized voice, text, and mouse traces over the objects being described. In
Open Images V6 we released 675k localized narratives annotations on images from
Open Images (Table 5).

Table 5: Localized narrative counts on Open Images.

=============================== ======= ========== =======
\                               Train   Validation Test
=============================== ======= ========== =======
Images                          504,413 41,620     125,436
Localized narrative annotations 507,444 41,691     126,020
=============================== ======= ========== =======

Note we originally launched localized narratives only on train in V6, but since
July 2020 we also have validation and test covered. More information about this
type of annotations, as well as visualizations and annotations for other
datasets can be found in the `localized narratives standalone website
<https://google.github.io/localized-narratives/>`__.

*****************
Class definitions
*****************

Classes are identified by MIDs (Machine-generated Ids) as can be found in
`Freebase <https://en.wikipedia.org/wiki/Freebase>`__ or `Google Knowledge
Graph API <https://developers.google.com/knowledge-graph/>`__.  A short
description of each class is available in `class-descriptions.csv
<https://storage.googleapis.com/openimages/v6/oidv6-class-descriptions.csv>`__.

****************************
Statistics and data analysis
****************************

Hierarchy for the 600 boxable classes
=====================================

View the set of boxable classes as a hierarchy `here
<https://storage.googleapis.com/openimages/2018_04/bbox_labels_600_hierarchy_visualizer/circle.html>`__
or download it as a `JSON file
<https://storage.googleapis.com/openimages/2018_04/bbox_labels_600_hierarchy.json>`__:

********
Licenses
********

The annotations are licensed by Google LLC under `CC BY 4.0
<https://creativecommons.org/licenses/by/4.0/>`__ license. The images are
listed as having a `CC BY 2.0 <https://creativecommons.org/licenses/by/2.0/>`__
license. **Note:** while we tried to identify images that are licensed under a
Creative Commons Attribution license, we make no representations or warranties
regarding the license status of each image and you should verify the license
for each image yourself.

**********
References
**********

#. "`Extreme clicking for efficient object annotation
   <https://arxiv.org/abs/1708.02750>`__", Papadopolous et al., ICCV 2017.

#. "`We don't need no bounding-boxes: Training object class detectors using
   only human verification <https://arxiv.org/abs/1602.08405>`__", Papadopolous
   et al., CVPR 2016.

#. "`The Open Images Dataset V4: Unified image classification, object
   detection, and visual relationship detection at scale
   <https://arxiv.org/abs/1811.00982>`__", Kuznetsova et al., arXiv:1811.00982
   2018.

#. "`Large-scale interactive object segmentation with human annotators
   <https://arxiv.org/pdf/1903.10830>`__", Benenson et al., CVPR 2019.
