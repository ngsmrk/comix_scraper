module Kapow
  
  class ComixParser

    CATEGORIES = ['DARK HORSE COMICS', 'DC COMICS','IDW PUBLISHING','IMAGE COMICS','MARVEL COMICS','COMICS','MAGAZINES','MERCHANDISE']

    def parse(data)

      release_data = Kapow::ReleaseData.new

      current_section = ""
      data.each_with_index { | value, index |
        puts "Line #{index}: #{value}"

        next if blank? value

        release_data.categories << value && current_section = value if CATEGORIES.include?value

        values = value.split('\t')
        id = values[0]
        title = values[1]
        rrp = values[2]
        release_data.comix << Comic.new(current_section, id, title, rrp)
      }  

      release_data.shipping_date = DateTime.strptime(data[2].split[1], '%m/%d/%Y')
      
      return release_data

    end  
    
    private
    
    def blank? (value)
      false
    end

  end  

end