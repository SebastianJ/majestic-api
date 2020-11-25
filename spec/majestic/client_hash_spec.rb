require File.expand_path('../../spec_helper', __FILE__)

RSpec.describe Majestic::Api::Client do
  before { setup_client }
  let(:client) { Majestic::Api::Client.new }
  
  describe :get_index_item_info, vcr: {cassette_name: 'get_index_item_info'} do
    let(:item_info) { client.get_index_item_info(urls: ["google.com", "yahoo.com"], params: {data_source: :historic}) }
    let(:first_item_info) { item_info.parsed_items.first }
    
    it { expect(item_info).to be_a_kind_of Majestic::Api::ItemInfoResponse}
    it { expect(first_item_info).to be_a_kind_of Hash}
    
    expectations = {
      "ItemNum"=>0,
      "Item"=>"google.com",
      "ResultCode"=>"OK",
      "Status"=>"Found",
      "ExtBackLinks"=>338168260414,
      "RefDomains"=>59364262,
      "AnalysisResUnitsCost"=>338168260414,
      "ACRank"=>-1,
      "ItemType"=>1,
      "IndexedURLs"=>31890390648,
      "GetTopBackLinksAnalysisResUnitsCost"=>5000,
      "DownloadBacklinksAnalysisResUnitsCost"=>370058651062,
      "DownloadRefDomainBacklinksAnalysisResUnitsCost"=>1187335240,
      "RefIPs"=>6291489,
      "RefSubNets"=>749681,
      "RefDomainsEDU"=>116318,
      "ExtBackLinksEDU"=>2733998346,
      "RefDomainsGOV"=>53787,
      "ExtBackLinksGOV"=>1219484146,
      "RefDomainsEDU_Exact"=>7506,
      "ExtBackLinksEDU_Exact"=>585449265,
      "RefDomainsGOV_Exact"=>5303,
      "ExtBackLinksGOV_Exact"=>311614774,
      "CrawledFlag"=>"False",
      "LastCrawlDate"=>"",
      "LastCrawlResult"=>"",
      "RedirectFlag"=>"True",
      "FinalRedirectResult"=>"",
      "OutDomainsExternal"=>"0",
      "OutLinksExternal"=>"0",
      "OutLinksInternal"=>"0",
      "OutLinksPages"=>"1772670239",
      "LastSeen"=>"",
      "Title"=>"Google",
      "RedirectTo"=>"https://www.google.com/",
      "Language"=>"en,de",
      "LanguageDesc"=>"English,German",
      "LanguageConfidence"=>"91,55",
      "LanguagePageRatios"=>"60.6,4.1",
      "LanguageTotalPages"=>453179607,
      "RefLanguage"=>"en,es,fr,de",
      "RefLanguageDesc"=>
      "English,Spanish/Castilian,French,German",
      "RefLanguageConfidence"=>"94,72,72,75",
      "RefLanguagePageRatios"=>"54.3,1.4,1.2,0.7",
      "RefLanguageTotalPages"=>221977753930,
      "CrawledURLs"=>2851430625,
      "RootDomainIPAddress"=>"184.168.131.241",
      "TotalNonUniqueLinks"=>"369884579675",
      "NonUniqueLinkTypeHomepages"=>"728799922",
      "NonUniqueLinkTypeIndirect"=>"5812630101",
      "NonUniqueLinkTypeDeleted"=>"150840268959",
      "NonUniqueLinkTypeNoFollow"=>"47455726843",
      "NonUniqueLinkTypeProtocolHTTPS"=>"130100724239",
      "NonUniqueLinkTypeFrame"=>"19289694813",
      "NonUniqueLinkTypeImageLink"=>"84772551954",
      "NonUniqueLinkTypeRedirect"=>"3175874916",
      "NonUniqueLinkTypeTextLink"=>"262646457992",
      "RefDomainTypeLive"=>"34136353",
      "RefDomainTypeFollow"=>"56347541",
      "RefDomainTypeHomepageLink"=>"27500569",
      "RefDomainTypeDirect"=>"58683307",
      "RefDomainTypeProtocolHTTPS"=>"21899625",
      "CanonicalURL"=>"",
      "CitationFlow"=>95,
      "TrustFlow"=>99,
      "TrustMetric"=>99,
      "TopicalTrustFlow_Topic_0"=>"Computers/Internet/Searching",
      "TopicalTrustFlow_Value_0"=>95,
      "TopicalTrustFlow_Topic_1"=>"Computers/Internet/On the Web",
      "TopicalTrustFlow_Value_1"=>92,
      "TopicalTrustFlow_Topic_2"=>"Computers/Software",
      "TopicalTrustFlow_Value_2"=>90
    }
    
    expectations.each do |key, value|
      it "should have correct value for instance variable #{key}" do
        expect(first_item_info.fetch(key)).to eq value
      end
    end
    
  end  
end
