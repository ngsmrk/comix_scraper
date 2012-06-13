require 'spec_helper'

describe Kapow::ComixScraper do
  
  before :each do
    @scraper = Kapow::ComixScraper.new('http://www.previewsworld.com/')
  end
  
  it 'can get new releases' do
    @scraper.get_new_releases.should_not be_nil
    @scraper.get_new_releases.should be_instance_of Kapow::ReleaseData
  end
  
  it 'can get upcoming releases' do
    @scraper.get_upcoming_releases.should_not be_nil
    @scraper.get_new_releases.should be_instance_of Kapow::ReleaseData
  end
    
end