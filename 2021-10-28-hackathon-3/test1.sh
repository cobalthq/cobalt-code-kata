#!/bin/bash

mkdir -p test
cp ./main1.rb ./test/1.rb
ruby ./test/1.rb > ./test/2.kt
kotlinc ./test/2.kt -include-runtime -d ./test/2.jar && java -jar ./test/2.jar > ./test/3.go
go run ./test/3.go > ./test/4.js
node ./test/4.js > ./test/5.rb
diff ./test/1.rb ./test/5.rb
