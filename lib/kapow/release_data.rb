module Kapow
  
  class ReleaseData
    
    attr_accessor :shipping_date, :categories, :comix
    
    def initialize
      
      @categories = []
      @comix = []
      
    end
    
  end
end