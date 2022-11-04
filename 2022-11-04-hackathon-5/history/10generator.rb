t = <<'RUBY'.gsub('MOD', '900001')
eval$q=%q(eval(%w(puts"eval=eval=eval=\47eval$q=%q(#$q)\47##\47;
(eval.unpack(%(H*)).first.hex%MOD==#{eval.unpack(%(H*)).first.hex%MOD})&&eval(eval);
eval.scan(//){(s=$`+((#{eval.sum}-eval.sum)%256).chr+$\47).unpack(%(H*))[0].hex%MOD==#{eval.unpack(%(H*)).first.hex%MOD}&&eval(eval=s)};
eval.scan(/./){(s=$`+((#{eval.sum}-eval.sum+$&.sum)%256).chr+$\47).unpack(%(H*))[0].hex%MOD==#{eval.unpack(%(H*)).first.hex%MOD}&&eval(eval=s)};
").join(%()).tr(";",10.chr));
exit)
RUBY

eval(eval=t.chomp)
