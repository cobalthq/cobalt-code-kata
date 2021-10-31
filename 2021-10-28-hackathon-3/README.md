# Quine Relay

## Running

Run `./test.sh` to make a full relay cycle and check the diff. Explore files in `test` folder to see each step.
The test starts by copying `main.rb` file to `test/1.rb`, which makes ruby the first step.

## Building

To build a quine run `ruby build.rb`. This will create a new `main.rb` based on queue quines and `logo.txt` schema.

### Extending

To add a new language:

1. Add a queue template that follows constraints:
  i. Expects a string that has ':' separated queue of the next templates
  ii. Has the queue string filled with «QUEUE» value in the template itself
  iii. Make sure the template body is escaped when output: space is replaced with `?s`, tab is replaced with `?t`, `"` is replaced by `?q` and `:` is replaced by `?c`
  iv. Make sure that when output template contains «QUEUE» instead of the queue string so that it can be reused as template in future cycles
  v. Make sure all escaping sequences are obfuscated to not be replaced with quotes and spaces when it comes to this version
  vi. The program then takes the first chunk of the queue before the first «:» and unescapes the logic above in reverse
  vii. It then concats itself escaped to the end of the queue and puts the queue string in place of the «QUEUE» of the next template
  viii. It then outputs the resulting program with an endline
2. Add the instruction to run it into the instructions list in `build.rb` in **any place except the last**
3. If needed replace logo.txt with a bigger version to fit all the text
4. Add instructions to `test.sh` at the same place you added running instructions in `build.rb`
5. Make sure that test passes with the newly generated `main.rb`

## Inspiration

* [Quine Relay by Yusuke Endoh](https://github.com/mame/quine-relay)
