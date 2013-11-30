require 'sinatra/base'
# require 'sinatra-websocket'
require 'opal-sprockets'
# require 'thread_safe'

module ChatDemo
  class App < Sinatra::Base
    # set :sockets, ThreadSafe::Array.new

    helpers do
      def opal(template, options = {}, locals = {}, &block)
        render(:opal, template, options, locals, &block)
      end

      def scheme
        @scheme ||= ENV['RACK_ENV'] == 'production' ? 'wss://' : 'ws://'
      end
    end

    get '/' do
      haml :index
    end
  end
end
