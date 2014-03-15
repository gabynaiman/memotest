ENV['RACK_ENV'] ||= 'development'

Encoding.default_external = Encoding::UTF_8

require 'bundler/setup'
Bundler.require(:default)

require 'json'
require 'cuba/render'

Cuba.plugin Cuba::Render
Cuba.settings[:render][:template_engine] = :slim

Cuba.use Rack::Static,
         urls: %w[/css /fonts /html /images /js],
         root: File.expand_path('public', File.dirname(__FILE__))

Cuba.define do

  on root do
    res.write view(:memotest)
  end

  on 'board' do
    cards = (0..9).to_a * 2
    board = cards.shuffle.each_slice(5).to_a
    res.write JSON.dump(board)
  end

end
