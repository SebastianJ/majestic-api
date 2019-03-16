require File.expand_path('../../spec_helper', __FILE__)

RSpec.describe Majestic::Api::Client do
  before { setup_client }
  let(:client) { Majestic::Api::Client.new }
  
  describe :get_index_item_info, vcr: {cassette_name: 'get_index_item_info'} do
    let(:item_info) { client.get_index_item_info(urls: ["google.com", "yahoo.com"], params: {data_source: :historic}) }
    let(:first_item_info) { item_info.parsed_items.first }
    
    it { expect(item_info).to be_a_kind_of Majestic::Api::ItemInfoResponse}
    
    expectations = {
      "ItemNum"=>0,
      "Item"=>"google.com",
      "ResultCode"=>"OK",
      "Status"=>"Found",
      "ExtBackLinks"=>289348199651,
      "RefDomains"=>59646501,
      "AnalysisResUnitsCost"=>289348199651,
      "ACRank"=>-1,
      "ItemType"=>1,
      "IndexedURLs"=>30425454562,
      "GetTopBackLinksAnalysisResUnitsCost"=>5000,
      "DownloadBacklinksAnalysisResUnitsCost"=>319773654213,
      "DownloadRefDomainBacklinksAnalysisResUnitsCost"=>1192980020,
      "RefIPs"=>5744686,
      "RefSubNets"=>681057,
      "RefDomainsEDU"=>106172,
      "ExtBackLinksEDU"=>1766201785,
      "RefDomainsGOV"=>55795,
      "ExtBackLinksGOV"=>814594606,
      "RefDomainsEDU_Exact"=>8758,
      "ExtBackLinksEDU_Exact"=>445133442,
      "RefDomainsGOV_Exact"=>6085,
      "ExtBackLinksGOV_Exact"=>173406157,
      "CrawledFlag"=>"False",
      "LastCrawlDate"=>"",
      "LastCrawlResult"=>"",
      "RedirectFlag"=>"True",
      "FinalRedirectResult"=>"",
      "OutDomainsExternal"=>"0",
      "OutLinksExternal"=>"0",
      "OutLinksInternal"=>"0",
      "OutLinksPages"=>"1770830247",
      "LastSeen"=>"",
      "Title"=>"Google",
      "RedirectTo"=>"https://www.google.com/",
      "Language"=>"en,de",
      "LanguageDesc"=>"English,German",
      "LanguageConfidence"=>"93,70",
      "LanguagePageRatios"=>"77.8,1.6",
      "LanguageTotalPages"=>372291317,
      "RefLanguage"=>"en,es,fr,de,it,ru,pt,ja",
      "RefLanguageDesc"=>
      "English,Spanish/Castilian,French,German,Italian,Russian,Portuguese,Japanese",
      "RefLanguageConfidence"=>"95,75,74,77,71,70,85,84",
      "RefLanguagePageRatios"=>"57.5,2.9,2.7,2.7,0.9,0.4,0.1,0.1",
      "RefLanguageTotalPages"=>125927874496,
      "CrawledURLs"=>2785142737,
      "RootDomainIPAddress"=>"108.177.12.102",
      "TotalNonUniqueLinks"=>"311021823116",
      "NonUniqueLinkTypeHomepages"=>"824080207",
      "NonUniqueLinkTypeIndirect"=>"3869955676",
      "NonUniqueLinkTypeDeleted"=>"139534904357",
      "NonUniqueLinkTypeNoFollow"=>"41397286377",
      "NonUniqueLinkTypeProtocolHTTPS"=>"61634346765",
      "NonUniqueLinkTypeFrame"=>"13797514536",
      "NonUniqueLinkTypeImageLink"=>"59680074295",
      "NonUniqueLinkTypeRedirect"=>"3253567189",
      "NonUniqueLinkTypeTextLink"=>"234290667096",
      "RefDomainTypeLive"=>"30485745",
      "RefDomainTypeFollow"=>"56930645",
      "RefDomainTypeHomepageLink"=>"28764954",
      "RefDomainTypeDirect"=>"58597484",
      "RefDomainTypeProtocolHTTPS"=>"10762896",
      "CanonicalURL"=>"",
      "CitationFlow"=>100,
      "TrustFlow"=>99,
      "TrustMetric"=>99,
      "TopicalTrustFlow_Topic_0"=>"Computers/Internet/Searching",
      "TopicalTrustFlow_Value_0"=>93,
      "TopicalTrustFlow_Topic_1"=>"Computers/Software",
      "TopicalTrustFlow_Value_1"=>92,
      "TopicalTrustFlow_Topic_2"=>"Computers/Internet/On the Web",
      "TopicalTrustFlow_Value_2"=>91
    }
    
    expectations.each do |key, value|
      it "should have correct value for instance variable #{key}" do
        expect(first_item_info.fetch(key)).to eq value
      end
    end
    
  end  
end
