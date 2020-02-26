# Rubyutils

repository for various utilities written (mostly) in ruby

## mdtohtml.rb

Convert markdown files to html files.  (convert ".md" within text to "html)

Usage: ruby mdtohtml.rb file1 file2 ...

Install: you need to install RDiscount. Use:
   (sudo) gem install rdiscount

I had problems with gemspec file of RDiscount, which I need to fix by:
  sudo chmod og+r /var/lib/gems/2.5.0/specifications/*
