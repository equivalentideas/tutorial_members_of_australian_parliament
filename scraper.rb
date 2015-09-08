require 'mechanize'

agent = Mechanize.new
url = 'https://morph.io/documentation/examples/australian_members_of_parliament'
page = agent.get(url)

member = {
  name: page.at('.search-filter-results').at('li').at('.title').inner_text.strip
}

p member
