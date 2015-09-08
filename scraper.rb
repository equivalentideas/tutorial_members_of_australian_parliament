require 'mechanize'

agent = Mechanize.new
url = 'https://morph.io/documentation/examples/australian_members_of_parliament'
page = agent.get(url)

member = {
  name: page.at('.search-filter-results').at('li').at('.title').inner_text.strip,
  electorate: page.at('.search-filter-results').at('li').search('dd')[0].inner_text,
  party: page.at('.search-filter-results').at('li').search('dd')[1].inner_text,
  url: page.at('.search-filter-results').at('li').at('.title a').attr('href')
}

p member
