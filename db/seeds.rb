# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

doc = Nokogiri::HTML(open('https://news.ycombinator.com/news'))

keys = doc.search('td.title a').map {|e| e['href']}

values = doc.search('td.title a').map {|e| e.text }

resource = Hash[*keys.zip(values).flatten]
resource = resource.reject! {|k,v| k[0..3] != "http" }

resource.each do |k,v|
  puts "Parsing \"#{v}\""
  Content.create link: k, title: v, total_shares: SocialShares.total(k, %w(facebook google reddit linkedin buffer)), facebook_shares: SocialShares.facebook(k), google_shares: SocialShares.google(k), reddit_shares: SocialShares.reddit(k), linkedin_shares: SocialShares.linkedin(k), buffer_shares: SocialShares.buffer(k)
end
contents = Content.all

puts "#{contents.count} links created"