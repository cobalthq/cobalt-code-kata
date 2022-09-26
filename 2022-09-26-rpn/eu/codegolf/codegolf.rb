# f=->s{t=[];a=s.split;while(n=a.shift);/\d/=~n&&t.push(n.to_i)||t[-1]=t[-2].send(n,t.pop);end;t[0]}
# f=->s{t=[];a=s.split;while(n,*a=a;n);/\d/=~n&&t.<<(n)||t[-1]=eval(t[-2]+n+t.pop).to_s;end;t[0]}
# f=->s{t=[];a=s.split;while(n,*a=a;n);/\d/=~n&&t.push(n.to_i)||t=[*t[..-3],t[-2..].inject(&n)];end;t[0]}
# f=->s{t=[];a=s.split;while(n,*a=a;n);/\d/=~n&&t<<(n.to_i)||t[-1]=t[-2].send(n,t.pop);end;t[0]}
# f=->s{s.split.inject([]){|t,n|[*t[..-3],t[-2..].inject(&:"#{n}")] rescue [*t,n.to_i]}[0]}
# f=->s{s.split.inject([]){|t,n|/\d/=~n&&t<<(n.to_i)||t[-1]=t[-2].send(n,t.pop);t}[0]}
# f=->s{s.split.inject([]){|t,n|/\d/=~n ?[*t,n.to_i]:[*t[..-3],t[-2].send(n,t.pop)]}[0]}
# f=->s{s.split.inject([]){|t,n|/\d/=~n ?[*t,n.to_i]:[*t[..-3],eval(t[-2..]*n)]}[0]}
# ^^^ git hostory ^^^

f=->s{s.split.inject([]){|t,n|n=~/\d/?[*t,n.to_i]:[*t[..-3],eval(t[-2..]*n)]}[0]}

p f['2'] # => 2
p f['2 3 +'] # => 2 + 3 = 5
p f['20 5 /'] # => 20 / 5 = 4
p f['4 2 + 3 -'] # => (4 + 2) - 3 = 3
p f['3 5 8 * 7 + *'] # => ((5 * 8) + 7) * 3 = 141
