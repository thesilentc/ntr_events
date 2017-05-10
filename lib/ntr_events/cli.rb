# CLI controller
class NtrEvents::CLI

  def call
   puts "Welcome to National Team Roping Events"
   NtrEvents::Scraper.new.scrape_events
   list_events
   menu
  end

 def list_events
   NtrEvents::Event.all.each_with_index do |event, i|
     puts "#{i+1} #{event.name}"
   end
 end

 def menu
   input = ""
   while input != "exit"
     puts "What story do you want to read?"
     input = gets.strip

     if input.to_i-1 <= NtrEvents::Event.all.size
       story = NtrEvents::Event.all[input.to_i-1]

       puts event.name
       puts
       puts "Event Round #{event.round}"
       puts "Winners: #{story.summary}"

       puts "Would you like to see more?"
       answer = gets.strip

       if ["Y", "YES"].include?(answer.upcase)
         # how do I get the content for this story?
         story.open_in_browser
       end
     end
     puts "Would you like to exit or list again?"
     input = gets.strip
   end
 end
end
