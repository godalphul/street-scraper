CONFIG =  YAML.load(File.read(File.expand_path('../../config/translators/street_sweeping.yml', __FILE__)))

base_url = CONFIG["api"]["base_url"]

0.upto(0) do |n|
  offset = n * CONFIG["api"]["result_count"]
  full_url = "#{base_url}&#{CONFIG["api"]["offset_name"]}=#{offset}&#{CONFIG["api"]["result_count_name"]}=#{CONFIG["api"]["result_count"]}"
  response = HTTParty.get("#{full_url}")
  read_and_save(response)
  hash = JSON.parse response
  hash[CONFIG["api"]["object_path"]].each do |result|
    a = result["attributes"]
    #name = [a["PREFIX"], a["NAME"], a["SUFFIX"], a["TYPE"]].reject {|item| item == " "}.join(" ")
    #street = Street.find_or_create_by(name: name) 
    CONFIG["attributes"].each do |attributes|
      model_attribute_name = attributes[0]
      api_attribute_name = attributes[1]
      puts "#{model_attribute_name} = #{a[api_attribute_name]}"
      
    end
  end
end



