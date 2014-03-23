#!/bin/bash
echo "This script will setup your workspace"
nodeVersion=`node -v`
echo "NodeJS version $nodeVersion is installed"
bowerVersion=`bower -v`
echo "Bower version $bowerVersion is installed"
echo "Installing npm packages"
npm install
echo "Installing bower packages"
bower install
