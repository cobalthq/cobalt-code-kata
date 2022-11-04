t = <<'TEXT'.gsub(/\d/) { |n| ['\47eval$q=%q(#$q)\47','eval','instance_','\\12',"'"][n.to_i] }
1=41$q=%q(
puts "1=0321=031(1=[1,21].detect{|s|s.unpack(%q(H*))==#{1.unpack(%q(H*)).first.hex}}||1)"
)4
1 1
TEXT

eval t
# eval='eval$q=%q(
# puts "eval=\47eval$q=%q(#$q)\47\12instance_eval=\47eval$q=%q(#$q)\47\12eval([eval, instance_eval].detect{|s|s.unpack(%q(H*))==#{eval.unpack(%q(H*))[0].hex}} || eval)"
# )'
# instance_eval='eval$q=%q(
# puts "eval=\47eval$q=%q(#{$q})\47\12eval eval"
# )'
# eval([eval, instance_eval].detect{|s|s.hash==0} || eval)
