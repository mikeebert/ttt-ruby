require 'rubygems'
require 'spec'
require 'limelight/specs/spec_helper'
# require 'limelight/mouse'

# Set the Gem home to the frozen gems
$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../")
Gem.use_paths(File.join($PRODUCTION_PATH , "__resources", "gems"), Gem.default_path)


Dir.glob(File.join("__resources", "gems", "gems", "**", "lib")).each do |dir|
  $: << dir
end

$: << File.expand_path(File.dirname(__FILE__) + "/../../lib")
$: << File.expand_path(File.dirname(__FILE__) + "/../../spec")
$: << File.expand_path(File.dirname(__FILE__) + "/../../spec/mocks")