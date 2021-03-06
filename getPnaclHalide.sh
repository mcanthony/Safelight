# Copyright 2015 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS-IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


#!/bin/bash
# Downloads PNaCl Halide binary distribution based on a user's gcc version.

set -e

gccVersion="`g++ --version | grep '[0-9]\.[0-9]\.[0-9]' -o`"
if [[ $gccVersion == *"4.8"* ]]
then
  gccVersion="48"
elif [[ $gccVersion == *"4.9"* ]]
then
  gccVersion="49"
else
  exit
fi

echo ">>>>>>>>>> Downloading Linux_64 PNaCl Halide, gcc version ${gccVersion}..."
wget https://github.com/halide/Halide/releases/download/release_2015_09_11/halide-linux-64-gcc${gccVersion}-pnacl-dfcb1fa1e8eceb55bc282b2c73a5c9ae288bcc4f.tgz 
tar zxvf halide-linux-64-gcc${gccVersion}-pnacl-dfcb1fa1e8eceb55bc282b2c73a5c9ae288bcc4f.tgz 
rm halide-linux-64-gcc${gccVersion}-pnacl-dfcb1fa1e8eceb55bc282b2c73a5c9ae288bcc4f.tgz 

halideDir="`pwd`/halide/"
exportCmd="export HALIDE_DIR=\"$halideDir\""
$exportCmd
echo "Halide dir is $HALIDE_DIR"
echo "$exportCmd" >> ~/.bashrc
