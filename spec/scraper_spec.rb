require 'spec_helper'

describe ComixScraper::Scraper do
  
  before :each do
    @scraper = ComixScraper::Scraper.new()
  end
  
  it 'can get new releases' do
    @scraper.get_new_releases.should_not be_nil
    @scraper.get_new_releases.should be_instance_of ComixScraper::ReleaseData
  end
  
  it 'can get upcoming releases' do
    @scraper.get_upcoming_releases.should_not be_nil
    @scraper.get_new_releases.should be_instance_of ComixScraper::ReleaseData
  end
    
end