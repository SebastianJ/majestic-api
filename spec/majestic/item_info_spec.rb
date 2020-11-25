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
      "analysis_results_unit_cost" => 338168260414,
      "citation_flow" => 95,
      "crawled" => false,
      "crawled_urls" => 2851430625,
      "download_backlinks_analysis_results_unit_cost" => 370058651062,
      "download_referring_domains_analysis_results_unit_cost" => 1187335240,
      "error_message" => "",
      "exact_external_edu_backlinks" => 585449265,
      "exact_external_gov_backlinks" => 311614774,
      "exact_referring_edu_domains" => 7506,
      "exact_referring_gov_domains" => 5303,
      "external_backlinks" => 338168260414,
      "external_edu_backlinks" => 2733998346,
      "external_gov_backlinks" => 1219484146,
      "get_top_backlinks_analysis_results_unit_cost" => 5000,
      "index" => 0,
      "indexed_urls" => 31890390648,
      "language_codes" => ["en", "de"],
      "language_confidences" => [91, 55],
      "language_descriptions" => ["English", "German"],
      "language_page_ratios" => [60.6, 4.1],
      "language_total_pages" => 453179607,
      "non_unique_link_types" => {:deleted=>150840268959, :frame=>19289694813, :homepages=>728799922, :https=>130100724239, :image_link=>84772551954, :indirect=>5812630101, :no_follow=>47455726843, :redirect=>3175874916, :text_link=>262646457992},
      "outbound_domain_links" => 0,
      "outbound_external_backliks" => 0,
      "outbound_internal_backlinks" => 0,
      "outbound_links_pages" => 1772670239,
      "redirecting" => true,
      "redirecting_to" => "https://www.google.com/",
      "referring_domain_types" => {:direct=>58683307, :follow=>56347541, :homepage_link=>27500569, :https=>21899625, :live=>34136353},
      "referring_domains" => 59364262,
      "referring_edu_domains" => 116318,
      "referring_gov_domains" => 53787,
      "referring_ip_addresses" => 6291489,
      "referring_language_codes" => ["en", "es", "fr", "de"],
      "referring_language_confidences" => [94, 72, 72, 75],
      "referring_language_descriptions" =>  ["English", "Spanish/Castilian", "French", "German"],
      "referring_language_page_ratios" => [54.3, 1.4, 1.2, 0.7],
      "referring_language_total_pages" => 221977753930,
      "referring_subnets" => 749681,
      "result_code" => "OK",
      "root_domain_ip_address" => "184.168.131.241",
      "status" => "Found",
      "success" => true,
      "title" => "Google",
      "topical_trust_flows" => {0=>{:topic=>"Computers/Internet/Searching", :value=>95}, 1=>{:topic=>"Computers/Internet/On the Web", :value=>92}, 2=>{:topic=>"Computers/Software", :value=>90}},
      "total_non_unique_links" => 369884579675,
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
