#!/bin/bash

mkdir -p test
cp main1.rb test/1.rb
# ruby test/1.rb > test/3.js
ruby test/1.rb > test/2.kt
kotlinc test/2.kt -include-runtime -d test/2.jar && java -jar test/2.jar > test/3.js
node test/3.js > test/4.rb
diff test/1.rb test/4.rb
