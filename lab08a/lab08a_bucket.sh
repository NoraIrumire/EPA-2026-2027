#!/bin/bash
# Lab08a: bucket storage walkthrough
GOOGLE_CLOUD_PROJECT=$(gcloud config get-value project) # set project variable
BUCKET=epa-lab08a-$RANDOM$RANDOM # unique bucket name, no personal info
echo $BUCKET # show the name
gsutil ls # list buckets
gsutil mb gs://$BUCKET # create bucket
echo $? # 0 means it worked
gsutil ls # bucket should show now
gsutil mb gs://$BUCKET # create again, fails noisily
echo $? # 1 means it failed
gsutil mb gs://$BUCKET 2>/dev/null # same failure, silenced
echo "Your text here" > README-cloudshell.txt # create the file
gsutil cp ./README-cloudshell.txt gs://$BUCKET # copy file to bucket
gsutil cp gs://$BUCKET/README-cloudshell.txt . # copy back (overwrites with no confirmation)
gsutil ls -L -b gs://$BUCKET # bucket details
gsutil acl ch -u AllUsers:R gs://$BUCKET/README-cloudshell.txt # make file public
curl -s https://storage.googleapis.com/$BUCKET/README-cloudshell.txt # should print your text
gsutil acl set private gs://$BUCKET/README-cloudshell.txt # make file private again
curl -s https://storage.googleapis.com/$BUCKET/README-cloudshell.txt # error or cached text
gsutil rm gs://$BUCKET/README-cloudshell.txt # delete file from bucket
gsutil ls gs://$BUCKET # confirm empty
