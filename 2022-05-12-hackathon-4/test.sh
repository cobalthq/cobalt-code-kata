#!/bin/zsh

# Go + Ruby

go run polyglot_go_rb.go > test_output_go
ruby polyglot_go_rb.go > test_output_rb
diff polyglot_go_rb.go test_output_go
diff polyglot_go_rb.go test_output_rb

rm -rf test_*

# Kotlin + Ruby

kotlinc polyglot_kt_rb.kt -include-runtime -d polyglot.jar && java -jar polyglot.jar > test_output_kt
ruby polyglot_kt_rb.kt > test_output_rb
diff polyglot_kt_rb.kt test_output_kt
diff polyglot_kt_rb.kt test_output_rb

rm -rf test_*

# Python + Ruby

python polyglot_py_rb.py > test_output_py
ruby polyglot_py_rb.py > test_output_rb
diff polyglot_py_rb.py test_output_py
diff polyglot_py_rb.py test_output_rb

rm -rf test_*

# JavaScript + Ruby

node polyglot_js_rb.js > test_output_js
ruby polyglot_js_rb.js > test_output_rb
diff polyglot_js_rb.js test_output_js
diff polyglot_js_rb.js test_output_rb

rm -rf test_*

# Python + Ruby + HTML

python polyglot.html > test_output_py
ruby polyglot.html > test_output_rb
diff polyglot.html test_output_py
diff polyglot.html test_output_rb

rm -rf test_*
