require 'spec_helper'

describe ComixScraper::ReleaseData do

  context 'getting by category' do

    before :each do

      f = File.open('spec/samples/new_releases.txt', 'r')
      new_releases = f.readline.split('\r\n')
  
      parser = ComixScraper::Parser.new
      @release_data = parser.parse(new_releases)
    end

    it 'returns an empty array if category does not exist' do
      @release_data.by_category('howdydoody').should == []
    end

    it 'returns the comix in the category' do
      comix = @release_data.by_category('marvel comics')
      comix.should_not == []
      comix.map { |c| c.category }.uniq.should == ['MARVEL COMICS']
    end
  end

end