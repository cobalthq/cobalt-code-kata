#!/bin/bash

node quine1.js > quine1.out
diff quine1.js quine1.out

node quine2.js > quine2.out
diff quine2.js quine2.out

node quine3.js > quine3.out
diff quine3.js quine3.out
