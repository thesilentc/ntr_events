class NtrEvents::Event
  attr_accessor :name, :date, :location, :winner, :url

  @@all = []

  def self.all
    @@all
  end

  def content
    @content ||= NtrEvents::Scraper.new(url).scrape_article
  end

  def open_in_browser
    system("open '#{url}'")
  end

  def save
    @@all << self
  end
end
