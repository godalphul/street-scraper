module Scraper
  
  def self.import(yaml_file)
    @config =  YAML.load(File.read(File.expand_path("../../../config/translators/#{yaml_file}", __FILE__)))
    base_url = @config["api"]["base_url"]
    max_number_of_calls = (@config["api"]["max_results"].to_i/@config["api"]["result_count"]).ceil
    
    0.upto(max_number_of_calls) do |n|
      offset = n * @config["api"]["result_count"]
      
      full_url = "#{base_url}&#{@config["api"]["offset_name"]}=#{offset}&#{@config["api"]["result_count_name"]}=#{@config["api"]["result_count"]}"
      response = HTTParty.get("#{full_url}")
      json_response = JSON.parse response
      Scraper.read(json_response)
    end
  end

  
  def self.read(response)
    response[@config["api"]["object_path"]].each do |result|
      street_name = [result["attributes"]["PREFIX"], result["attributes"]["NAME"], result["attributes"]["SUFFIX"], result["attributes"]["TYPE"]].reject {|item| item == " "}.join(" ")
      street = Street.find_or_create_by(name: street_name)
      params = Hash.new
      @config["attributes"].each do |translation| 
        #param = self.translate(result["attributes"], translation)
        model_attribute_name = translation[0]
        api_attribute_name = translation[1]
        params[model_attribute_name.to_sym] = result["attributes"][api_attribute_name]
      end
      street.create_or_update_restriction(params)
    end
  end
  
  def self.translate(attributes, translation)    
    model_attribute_name = translation[0]
    api_attribute_name = translation[1]
    return model_attribute_name.to_sym => attributes[api_attribute_name]
  end
  
end

