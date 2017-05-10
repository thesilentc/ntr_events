class NtrEvents::Scraper
  def initialize(url = nil)
    @url = url
  end

  def scrape_event
    @doc = Nokogiri::HTML(open(@url))
    @doc.search(".title-txt h1").text
  end

# event.name = doc.css(".title-txt h1").map {|e| puts e.text}
  def scrape_events
    @doc = Nokogiri::HTML(open("http://nationalteamroping.com/articles.sec-26-1-results.html"))
    @doc.search(".title-txt h1").each do |events_li|
      event = NtrEvents::Event.new

      a_tag = events_li.search("h1 a")
      if a_tag

          event.url = a_tag.attr("href").text

        event.name = article_li.search("h1").text
        event.location = article_li.search("div.byline").text
        event.date = article_li.search("p.excerpt").text

        event.save
      end
    end
  end

end
