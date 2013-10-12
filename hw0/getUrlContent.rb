

require "mechanize"

def get_value()
	url = 'http://google.de'

	user = "rene"
	password = "mypw"

	amount = Mechanize.new.
		post(url, :user => user, :pw => password).
		link_with(:href => /cardValue/i).
		click.
		parser.xpath("//tr/td[contains(.,'Clipper Cash')]").first.
		next_silbing.next_silbing.
		content.match( /$(\d+\.\d+)/ )
	html($1)
end


def get_html()
	url = 'http://www1.langenfeld.de/OPAC/index.asp'

	v = Mechanize.new.
	post(url, "kontofenster"=>true)
	
	puts(v.to_s)
end

get_html()


