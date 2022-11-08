eval = <<'RUBY'.gsub('MOD', '900001').chomp
eval$q=%q(eval((%w(eval||="eval$q=%q(#$q)#";puts"eval=eval=eval=\47eval$q=%q(#$q)#\47##\47;eval.sub!(/#+$/,\47#\47)^
/\#{eval_eval_if_eval.unpack(\47H*\47)[0].hex%MOD==#{eval.unpack("H*")[0].hex%MOD}}\47\51}/.i_rescue##/^
eval\42$d=#{eval.sum}-eval.sum^
eval.scan(//){(s=$`+($d%256).chr+$\47).unpack(%(H*))[0].hex%MOD==#{eval.unpack(%(H*))[0].hex%MOD}&&$d!=0&&eval(eval=s)}^
eval.scan(/./){(s=$`+(($d+$&.sum)%256).chr+$\47).unpack(%(H*))[0].hex%MOD==#{eval.unpack(%(H*))[0].hex%MOD}&&eval(eval=s)}#\42##\42^
eval_eval
")*%()).tr("_^",32.chr<<10));
exit)#
RUBY

# puts eval

eval(eval)
