require 'uri'
content = ""
a = 0
Dir.foreach("/Volumes/My\ Passport/Libros\ de\ dominio\ público/books") do |item|
  next if item == '.' or item == '..' or item =~ /^\..*/
    a += 1
    content += "<div class=\"col-xs-4 col-md-2\">\n"
    content += "  <a href=\"books/"+item[0..-5]+".pdf\">"
    content += "<img src=\""+URI.encode("covers/"+item[0..-5]+".png")+"\" class=\"img-responsive book\"></a>\n"
    content += "</div>\n"
  if a  == 3
    content += "<div class=\"col-xs-12 shelf hidden-md hidden-lg\"></div>\n"
  elsif a == 6
    content += "<div class=\"col-xs-12 shelf\"></div>\n"
    a = 0
  end

end

File.write('bookshelf.html', content)
