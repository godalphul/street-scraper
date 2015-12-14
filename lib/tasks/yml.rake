
task :yml => :environment do   
  file = YAML.load(File.read(File.expand_path('../../../config/translators/sweeper.yml', __FILE__)))
  puts file["en"]["hello"]
end