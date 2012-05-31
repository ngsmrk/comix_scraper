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
end