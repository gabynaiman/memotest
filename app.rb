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
    res.write view(:index)
  end

  on 'users' do
    sleep 1
    users = [
      {id: 1, name: 'Juan', rol: 'Admin'},
      {id: 2, name: 'Pedro', rol: 'Guest'},
      {id: 3, name: 'Toto', rol: 'Guest'},
    ]
    res.write JSON.dump(users)
  end

  on 'roles' do
    sleep 1
    roles = [
      {id: 1, name: 'Admin'},
      {id: 1, name: 'Guest'},
    ]
    res.write JSON.dump(roles)
  end

end
