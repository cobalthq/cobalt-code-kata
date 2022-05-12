#!/bin/zsh

go run polyglot_go_rb.go > test_output_go
ruby polyglot_go_rb.go > test_output_rb
diff polyglot_go_rb.go test_output_go
diff polyglot_go_rb.go test_output_rb
