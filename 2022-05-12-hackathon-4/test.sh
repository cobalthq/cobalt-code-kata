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
