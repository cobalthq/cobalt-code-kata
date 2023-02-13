# Dictionary Replacer

Ref: [codingdojo](https://codingdojo.org/kata/DictionaryReplacer/)

Create a method that takes a string and a dictionary, and replaces every key
in the dictionary pre and suffixed with a dollar sign, with the corresponding
value from the Dictionary.

## Example Tests

input : "", dict empty, output:""

input : "$temp$", dict { "temp" => "temporary" }, output: "temporary"

input : "$temp$ here comes the name $name$", dict { "temp" => "temporary",
"name" => "John Doe" }, output : "temporary here comes the name John Doe"
