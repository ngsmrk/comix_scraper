require 'spec_helper'

describe Kapow::ComixParser do

  context 'when it processes new releases' do

    before :each do

      f = File.open('spec/samples/new_releases.txt', 'r')
      new_releases = f.readline.split('\r\n')
  
      parser = Kapow::ComixParser.new
      @release_data = parser.parse(new_releases)
    end

    it 'it can find the shipping date' do
      @release_data.shipping_date.to_date.should == DateTime.strptime('30/05/2012', '%d/%m/%Y')   
    end

    it 'it can find the categories' do
      @release_data.categories.should   =~ ["COMICS", "DARK HORSE COMICS", "DC COMICS", "IDW PUBLISHING", "IMAGE COMICS", "MAGAZINES", "MARVEL COMICS", "MERCHANDISE"]            
    end

    it 'it can extract specific publication details' do
      puts @release_data
      
      comic = Kapow::Comic.new('DARK HORSE COMICS', 'MAR120044', 'ANGEL & FAITH #10 REBEKAH ISAACS VAR CVR', '$2.99')
      @release_data.comix.include?(comic).should eql true
    end

  end

end