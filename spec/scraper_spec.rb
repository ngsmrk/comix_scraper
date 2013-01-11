require 'spec_helper'

describe ComixScraper::Scraper do
  
  before :each do
    @scraper = ComixScraper::Scraper.new()
  end
  
  it 'can get new releases' do
    new_releases = @scraper.get_new_releases
    new_releases.should_not be_nil
    new_releases.should be_instance_of ComixScraper::ReleaseData
    new_releases.shipping_date.should_not be_nil
  end
  
  it 'can get upcoming releases' do
    upcoming_releases = @scraper.get_upcoming_releases
    upcoming_releases.should_not be_nil
    upcoming_releases.should be_instance_of ComixScraper::ReleaseData
    upcoming_releases.shipping_date.should_not be_nil
  end
    
end