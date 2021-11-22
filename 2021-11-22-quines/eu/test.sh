#!/bin/bash

ruby quine1.rb > quine1.out
diff quine1.rb quine1.out

node quine3.js > quine3.out
diff quine3.js quine3.out

ruby quine4.rb > quine4.out
diff quine4.rb quine4.out

node quine5.js > quine5.out
diff quine5.js quine5.out
