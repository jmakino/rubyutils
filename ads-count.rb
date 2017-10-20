#
# ads-count.rb
#
# last checked: 2017/10/21
#
if ARGV.size > 1
  $first_name_initial = ARGV[0]
  $family_name = ARGV[1]
else
  print "usage:   ads-count.rb initial family-name\n"
  print "example: ads-count.rb D. Sugimoto\n"
  exit
end
print "ADS  paper count for #{$family_name}, #{$first_name_initial}:\n"


w3mstr = <<END
http://ads.nao.ac.jp/cgi-bin/nph-abs_connect?db_key=AST&sim_query=YES
&aut_xct=NO&aut_logic=OR&obj_logic=OR&author=#{$family_name}%2C+#{$first_name_initial}.
&object=&start_mon=&start_year=&end_mon=&end_year=&ttl_logic=OR
&title=&txt_logic=OR&text=&nr_to_return=500&start_nr=1
&start_entry_day=&start_entry_mon=&start_entry_year=&min_score=
&jou_pick=NO&ref_stems=&data_and=ALL&group_and=ALL&sort=SCORE
&aut_syn=YES&ttl_syn=YES&txt_syn=YES&aut_wt=1.0&obj_wt=1.0&ttl_wt=0.3
&txt_wt=3.0&aut_wgt=YES&obj_wgt=YES&ttl_wgt=YES&txt_wgt=YES
&ttl_sco=YES&txt_sco=YES&version=1
END
w3mstr = "\"" + w3mstr.split("\n").join + "\""

oname= ".adstmp"

system "wget -o /dev/null -a /dev/null -O #{oname} #{w3mstr}"

yearcount={}
open(oname,"r"){|f|
  while s=f.gets
    if s =~ /bibcode=/
#      year = s.split[10].split("/")[1]
#      year = s.split("/")[10].split("<")[0]
      year = s.split("</td>")[4].split("/")[1]
      if  yearcount[year]
	yearcount[year] += 1
      else
	yearcount.store(year,1)
      end
    end
  end
}
#p yearcount.to_a.sort
yearcount.to_a.sort.each{|x| print x[0], " ", x[1], "\n"}
