#
# mdtohtml.rb
#
require 'rdiscount'
ARGV.each{|name|
  hname = name.gsub(/.md/,".html")
  File.open(name,"r"){|f|
    s=f.gets(nil)
    if s
      md= RDiscount.new(s.gsub(/.md/,".html"))
      File.open(hname,"w+"){|f|f.puts md.to_html}
    end
  }                       
}
