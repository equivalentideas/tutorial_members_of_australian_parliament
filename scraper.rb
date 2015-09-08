require 'mechanize'

agent = Mechanize.new
url = 'https://morph.io/documentation/examples/australian_members_of_parliament'

["1", "2", "3"].each do |page_number|
  page = agent.get(url + "?page=" + page_number)

  page.at('.search-filter-results').search('li').each do |li|
    member = {
      title: li.at('.title').inner_text.strip,
      electorate: li.search('dd')[0].inner_text,
      party: li.search('dd')[1].inner_text,
      url: li.at('.title a').attr('href')
    }

    p member
  end
end
