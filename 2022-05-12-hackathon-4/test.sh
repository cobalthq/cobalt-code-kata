#!/bin/zsh

# Go + Ruby

go run polyglot_go_rb.go > test_output_go
ruby polyglot_go_rb.go > test_output_rb
diff polyglot_go_rb.go test_output_go
diff polyglot_go_rb.go test_output_rb

# Kotlin + Ruby

kotlinc polyglot_kt_rb.kt -include-runtime -d polyglot.jar && java -jar polyglot.jar > test_output_kt
ruby polyglot_kt_rb.kt > test_output_rb
diff polyglot_kt_rb.kt test_output_kt
diff polyglot_kt_rb.kt test_output_rb
