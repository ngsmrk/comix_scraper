require 'httparty'

module Kapow
    
  class ComixScraper
      include HTTParty

      def initialize(base_url)
        @base_url = base_url
      end

      def get_new_releases
        get_data("/shipping/newreleases.txt")
      end    

      def get_upcoming_releases
        get_data("/shipping/upcomingreleases.txt")
      end   

      private 

      def get_data(url)
        full_url = "#{@base_url}#{url}" 
        puts full_url
        data = self.class.get(full_url)      
        data.dump.split('\r\n')
      end 
  end
 
end