#!/bin/bash
nodeVersion=`node -v`
echo "NodeJS version $nodeVersion is installed"
bowerVersion=`bower -v`
echo "Bower version $bowerVersion is installed"
echo "Updating npm packages"
npm update
echo "Updating Bower packages"
bower update
