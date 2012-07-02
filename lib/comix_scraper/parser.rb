module ComixScraper
  
  class Parser

    CATEGORIES = ['DARK HORSE COMICS', 'DC COMICS','IDW PUBLISHING','IMAGE COMICS','MARVEL COMICS','COMICS','MAGAZINES','MERCHANDISE']

    def parse(data)

      release_data = ComixScraper::ReleaseData.new

      current_section = ""
      data.each_with_index { | value, index |

        release_data.categories << value && current_section = value if CATEGORIES.include?value

        values = value.split('\t')
        
        next if values.length != 3
        
        id = values[0]
        title = values[1]
        rrp = values[2]
        release_data.comix << Comic.new(current_section, id, title, rrp)
      }  

      puts "Shipping date: #{data[2].split}"
      release_data.shipping_date = data[2].split[1]
      
      return release_data

    end  
    
    private
    
    def blank? (value)
      false
    end

  end  

end