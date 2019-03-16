require File.expand_path('../../spec_helper', __FILE__)

RSpec.describe Majestic::Api::Client do
  before { setup_client }
  let(:client) { Majestic::Api::Client.new }
  
  describe :get_index_item_info, vcr: {cassette_name: 'get_index_item_info'} do
    let(:item_info) { client.get_index_item_info(urls: ["google.com", "yahoo.com"], params: {data_source: :historic}) }
    let(:first_item_info) { item_info.items.first }
    
    it { expect(item_info).to be_a_kind_of Majestic::Api::ItemInfoResponse}
    it { expect(first_item_info).to be_a_kind_of Majestic::Api::ItemInfo}
    
    expectations = {
      "ac_rank" => -1,
      "analysis_results_unit_cost" => 289348199651,
      "citation_flow" => 100,
      "crawled" => false,
      "crawled_urls" => 2785142737,
      "download_backlinks_analysis_results_unit_cost" => 319773654213,
      "download_referring_domains_analysis_results_unit_cost" => 1192980020,
      "error_message" => "",
      "exact_external_edu_backlinks" => 445133442,
      "exact_external_gov_backlinks" => 173406157,
      "exact_referring_edu_domains" => 8758,
      "exact_referring_gov_domains" => 6085,
      "external_backlinks" => 289348199651,
      "external_edu_backlinks" => 1766201785,
      "external_gov_backlinks" => 814594606,
      "get_top_backlinks_analysis_results_unit_cost" => 5000,
      "index" => 0,
      "indexed_urls" => 30425454562,
      "language_codes" => ["en", "de"],
      "language_confidences" => [93, 70],
      "language_descriptions" => ["English", "German"],
      "language_page_ratios" => [77.8, 1.6],
      "language_total_pages" => 372291317,
      "non_unique_link_types" => {
        :homepages=>824080207,
        :indirect=>3869955676,
        :deleted=>139534904357,
        :no_follow=>41397286377,
        :https=>61634346765,
        :frame=>13797514536,
        :image_link=>59680074295,
        :redirect=>3253567189,
        :text_link=>234290667096
      },
      "outbound_domain_links" => 0,
      "outbound_external_backliks" => 0,
      "outbound_internal_backlinks" => 0,
      "outbound_links_pages" => 1770830247,
      "redirecting" => true,
      "redirecting_to" => "https://www.google.com/",
      "referring_domain_types" => {
        :live=>30485745,
        :follow=>56930645,
        :homepage_link=>28764954,
        :direct=>58597484,
        :https=>10762896
      },
      "referring_domains" => 59646501,
      "referring_edu_domains" => 106172,
      "referring_gov_domains" => 55795,
      "referring_ip_addresses" => 5744686,
      "referring_language_codes" => ["en", "es", "fr", "de", "it", "ru", "pt", "ja"],
      "referring_language_confidences" => [95, 75, 74, 77, 71, 70, 85, 84],
      "referring_language_descriptions" =>  [
        "English",
        "Spanish/Castilian",
        "French",
        "German",
        "Italian",
        "Russian",
        "Portuguese",
        "Japanese"
      ],
      "referring_language_page_ratios" => [57.5, 2.9, 2.7, 2.7, 0.9, 0.4, 0.1, 0.1],
      "referring_language_total_pages" => 125927874496,
      "referring_subnets" => 681057,
      "result_code" => "OK",
      "root_domain_ip_address" => "108.177.12.102",
      "status" => "Found",
      "success" => true,
      "title" => "Google",
      "topical_trust_flows" => {
        0=>{:topic=>"Computers/Internet/Searching", :value=>93},
        1=>{:topic=>"Computers/Software", :value=>92},
        2=>{:topic=>"Computers/Internet/On the Web", :value=>91}
      },
      "total_non_unique_links" => 311021823116,
      "trust_flow" => 99,
      "trust_metric" => 99,
      "type" => :root_domain,
      "url" => "google.com"
    }
    
    expectations.each do |key, value|
      it "should have correct value for instance variable #{key}" do
        expect(first_item_info.send(key)).to eq value
      end
    end
    
  end  
end
