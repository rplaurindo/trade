# require "trade/version"

module Trade

  root_path = File.expand_path("../..", __FILE__)
  lib_path = File.join(root_path, "lib")

  Dir[File.join(lib_path, "**/*.rb")].each do |file|
    require file
  end

end
