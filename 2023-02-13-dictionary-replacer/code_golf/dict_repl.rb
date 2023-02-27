f=->(i,d){i.gsub(/\$(.*?)\$/){d[$~[1]]||$&}}

p f["", {}]
p f["$temp$", {"temp" => "temporary"}]
p f["$temp$ here comes the name $name$", { "temp" => "temporary", "name" => "John Doe" }]
p f["$no$ dictionary is $not empty$", { "not empty" => "full" }]
