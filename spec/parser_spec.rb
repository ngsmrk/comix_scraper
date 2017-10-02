require 'spec_helper'

describe ComixScraper::Parser do

  context 'when it processes new releases' do

    before :each do

      f = File.open('spec/samples/new_releases.txt', 'r')
      new_releases = f.readline.split('\r\n')
  
      parser = ComixScraper::Parser.new
      @release_data = parser.parse(new_releases)
    end

    it 'it can find the shipping date' do
      @release_data.shipping_date.should == '1/9/2013'
    end

    it 'it can find the categories' do
      @release_data.categories.should   =~ ["COMICS & GRAPHIC NOVELS", "DARK HORSE COMICS", "DC COMICS", "IDW PUBLISHING", "IMAGE COMICS", "MAGAZINES", "MARVEL COMICS", "MERCHANDISE"]
    end

    it 'it can extract specific publication details' do
      @release_data.comix.each { | comic | puts comic.title }
      
      comic = ComixScraper::Comic.new('DARK HORSE COMICS', 'MAR120044', 'ANGEL & FAITH #10 REBEKAH ISAACS VAR CVR', '$2.99')
      @release_data.comix.include?(comic).should eql true
    end

  end

end