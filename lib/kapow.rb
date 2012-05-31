require 'httparty'
require "kapow/version"

module Kapow
  
  class Comic

    attr_reader :category, :id, :title, :rrp

    def initialize(category, id, title, rrp)
      @category = category
      @id = id
      @title = title
      @rrp = rrp        
    end

    def to_s
      puts "#{@category} : #{@title}"
    end

    def == (other)
      other.category == self.category && other.id == self.id && other.title == self.title && other.rrp == self.rrp
    end

  end  
  
  class ComixParser

    CATEGORIES = ['DARK HORSE COMICS', 'DC COMICS','IDW PUBLISHING','IMAGE COMICS','MARVEL COMICS','COMICS','MAGAZINES','MERCHANDISE']

    attr_reader :shipping_date, :categories, :comix

    def initialize(data)
      @data = data
      @categories = []
      @comix = []
    end  

    def parse

      current_section = ""
      @data.each_with_index { | value, index |
        puts "Line #{index}: #{value}"

        next if value.blank?

        @categories << value && current_section = value if CATEGORIES.include?value

        values = value.split('\t')
        id = values[0]
        title = values[1]
        rrp = values[2]
        @comix << Comic.new(current_section, id, title, rrp)
      }  

      @shipping_date = DateTime.strptime(@data[2].split[1], '%m/%d/%Y')

    end  

  end  
  
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
