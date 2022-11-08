t = <<'TEXT'.gsub(/\d/) { |n| ['\47eval$q=%q(#$q)\47','eval','instance_','\\12',"'"][n.to_i] }
1=41$q=%q(1(%w(
puts "1=0321=031(1=[1,21].detect{|s|s.unpack(%q(H*))==#{1.unpack(%q(H*)).first.hex}}||1)"
).join(%())))4
1 1
TEXT

eval t

#####

eval='eval$q=%q(eval(%w(
puts "eval=\47eval$q=%q(#$q)\47\12instance_eval=\47eval$q=%q(#$q)\47\12eval(eval=[eval,instance_eval].detec      t{|s|s.unpack(%q(H*))==#{eval.unpack(%q(H*)).first.hex}}||eval)"
).join(%())))'
instance_eval='eval$q=%q(eval(%w(
puts "eval=\47eval$q=%q(#$q)\47\12instance_eval=\47eval$q=%q(#$q)\47\12eval(eval=[eval,instance_eval].detec      t{|s|s.unpack(%q(H*))==#{eval.unpack(%q(H*)).first.hex}}||eval)"
).join(%())))'
eval(eval=[eval,instance_eval].detect{|s|s.unpack(%q(H*))==21303844529002865808575325927931273432579347283705890296143705251665057579306577001901152163700136484959338652781070965472080569414194466219786145109615310015373324537962240902905181516949209004407986609088325079155033858737013666074911615975425204866069263646637721980234506178638391930677929479140938823447731880776954139788138963510136634283707130104645624127506069180708840968324141248808435464121230033425039274754075112554863811662526534486096572425175987364069303015765536091769081123022059178895657}||eval)
