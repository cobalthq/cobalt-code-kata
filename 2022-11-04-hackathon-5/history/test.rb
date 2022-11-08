GREEN = 32
RED = 31
YELLOW = 33

def color(c, str)
  "\e[#{c}m#{str}\e[0m"
end

def run(f)
  `ruby #{f} 2>&1`
end

prog = ARGV[0]

src = File.read(prog)
out = run(prog)

puts color(GREEN, 'QUINE!')

puts

replacement = (?0..?9).to_a + (?a..?z).to_a

src.chars.each_with_index do |c, i|
  File.write('tmp.rb', src[...i] + src[(i+1)..])
  if run('tmp.rb') == src
    File.write('tmp.rb', src[...i] + replacement.sample + src[(i+1)..])
    if run('tmp.rb') == src
      print color(GREEN, c)
    else
      print color(YELLOW, c)
    end
  else
    print color(RED, c)
  end
end
