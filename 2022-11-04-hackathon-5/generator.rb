eval=<<'RUBY'.chomp
eval$q=%q(eval((%w(eval||="eval$q=%q(#$q)#";$s="eval=eval=eval=
\47eval$q=%q(#$q)#\47##\47;eval.gsub!(/#+$/,\47#\47)^/\#{eval@eval@if@eval.unpac
k(\47H*\47)[0].hex%999961==#{eval.unpack("H*")[0].hex%999961}}\47\51}/.i@rescue#
#/^eval\42$d=#{eval.sum}-eval.sum;eval.scan(//){(s=$`+($d%256).chr+$\47).unpack(
%(H*))[0].hex%^999961==#{eval.unpack(%(H*))[0].hex%999961}&&$d!=0&&eval(eval=s)}
;eval.scan(/./){(s=$`+(($d+$&.sum)%256).chr+^$\47).unpack(%(H*))[0].hex%999961==
#{eval.unpack("H*")[0].hex%999961}&&eval(eval=s)}#\42##\42^eval@eval@###@thank@y
ou@mame@&@flagitious!@cobalt@hackathon@5@by@sergey@kruk@###";
if($*[0]=="test"&&!$o);
  $t=$s;define_method(:puts){|s|$o<<s};
  $><<"#$s#{10.chr<<27}[#{$s.chars.count{|c|c==10.chr}+1}A";
  $t.chars.each_with_index{|c,i|
  begin;
    $o="";eval($t[...i]+($*[1]&&$*[1].chars.sample||"")+($t[(i+1)..]||""));
  rescue(Exception);
    $!.is_a?(Interrupt)&&exit;
  end;
  $><<"#{27.chr}[#{$t==$o&&"32"||"31"}m#{c==32.chr&&?.||c}\e[0m";};$><<10.chr
;end;puts$s)*%()).tr("@^",32.chr<<10));exit)#
RUBY

lines = eval.split("\n")

template = <<'TEXT'.chomp
##      ###       ##        ##        ####  ####  ####   ####        ####   ####
#  ####  #  #####  #  #####  #  ##########  ###  ####  #  ######  ######  #  ###
#  #######  #####  #  #####  #  ##########  ##  ####  ###  #####  #####  ###  ##
#  #######  #####  #  #####  #      ######     ####  #####  ####  ####  #####  #
#  #######  #####  #  #####  #  ##########  ##  ###         ####  ####         #
#  ####  #  #####  #  #####  #  ##########  ###  ##  #####  ####  ####  #####  #
##      ###       ##        ##        ####  ####  #  #####  ####  ####  #####  #
TEXT

quine = lines[..6]
ascii = lines[7..].join.gsub(' ','')

quine += template.split("\n").map do |t_line|
  t_line.chars.inject("") do |acc, c|
    acc + (c == ' ' ? ' ' : ascii.slice!(0))
  end
end

quine += ascii.scan(/.{1,80}/)

eval(eval=quine.join("\n"))
