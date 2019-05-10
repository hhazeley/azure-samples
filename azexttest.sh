#!/bin/bash

sudo mkdir /azuretest
date=`date +%m-%d-%y`
datetime=`date +%D-%T`
echo "Log entry created $datetime" | sudo tee -a /azuretest/$date.log
