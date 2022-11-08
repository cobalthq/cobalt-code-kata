t = <<'TEXT'.gsub(/\d/) { |n| ['\47eval$q=%q(#$q)\47','eval','instance_',';'][n.to_i] }.gsub('MOD', '900001')
1='1$q=%q(1(%w(puts "1=0321=031(1=[1,21].detect{|s|s.unpack(%q(H*)).first.hex%MOD==#{1.unpack(%q(H*)).first.hex%MOD}}||1)").join(%()));exit)'
TEXT

eval(eval=eval(t))
