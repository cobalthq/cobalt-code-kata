#!/bin/bash

mkdir -p test
cp main.rb test/1.rb
ruby test/1.rb > test/2.go
go run test/2.go > test/3.js
node test/3.js > test/4.rb
diff test/1.rb test/4.rb