module ComixScraper
  
  class ReleaseData
    
    attr_accessor :shipping_date, :categories, :comix
    
    def initialize
      @categories = []
      @comix = []
    end

    def by_category(category)
      return [] unless @categories.include? category.upcase!

      @comix.select{ |comic| comic.category == category }
    end
  end
end