eval = <<'RUBY'.chomp
eval$q=%q(eval((%w(eval||="eval$q=%q(#$q)#";$s="eval=eval=eval=
\47eval$q=%q(#$q)#\47##\47;eval.gsub!(/#+$/,\47#\47)^/\#{eval@eval@if@eval.unpac
k(\47H*\47)[0].hex%900001==#{eval.unpack("H*")[0].hex%900001}}\47\51}/.i@rescue#
#/^eval\42$d=#{eval.sum}-eval.sum;eval.scan(//){(s=$`+($d%256).chr+$\47).unpack(
%(H      *))       [0        ]^         . hex%  9000   01==        #{ev   al.unp
ac  k(%(  H  *))[0  ]  .hex%  9  00001}&  &$d  !=0&  &  eval(e  val=s)  }  ;eval
.s  can(/.{  1}/){  (  s=$`+  (  ($d+$&.  su  m)%^  256  ).chr  +$\47  ).u  npac
k(  %(H*))[  0].he  x  %9000  0      1==     #{ev  al.un  pack  ("H*  ")[0  ].he
x%  900001}  &&eva  l  (eval  =  s)}#\42  ##  \42         ^eva  l@ev         al@
##  #@th  a  nk@yo  u  @mame  @  &@flagi  tio  us  !@cob  alt@  hack  athon  @5@
by@      ser       ge        y@        k  ruk@  #  ##";i  f($*  [0]=  ="tes  t"&
&!$o);$o="";$t=$s;define_method(:puts){|s|$o<<s};$><<"#$s#{10.chr<<27}[21A";$t.c
hars.each_with_index{|c,i|begin;eval($t[...i]+($*[1]&&$*[1].chars.sample||"")+($
t[(i+1)..]||""));rescue(Exception);$!.is_a?(Interrupt)&&exit;end;$><<"\e[#{$t==$
o&&"32"||"31"}m#{c}\e[0m";$o="";};$><<"\n";end;puts$s)*%()).tr("@^",32.chr<<10))
;exit)#
RUBY

eval(eval)
