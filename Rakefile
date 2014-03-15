require 'fileutils'

desc 'Copy files from bower_components to public'
task :copy do
  puts 'Copying files:'

  [
    'platform/platform.js',
    'platform/platform.js.map',
    'polymer/polymer.js',
    'polymer/polymer.js.map'
  ].each do |file|
    puts " public/js <- #{file}"
    FileUtils.cp File.expand_path("../bower_components/#{file}", __FILE__), File.expand_path('../public/js', __FILE__)
  end

  [
    'polymer/polymer.html',
    'polymer/polymer-body.html'
  ].each do |file|
    puts " public/html <- #{file}"
    FileUtils.cp File.expand_path("../bower_components/#{file}", __FILE__), File.expand_path('../public/html', __FILE__)
  end
end