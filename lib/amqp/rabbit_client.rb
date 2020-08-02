require 'rubygems'
require 'bunny'

# This class represents an object which gonna publish workflow IDs in the queue
# to be consumed
module Amqp
  class RabbitClient
    def initialize
      @conn = Bunny.new(host: ENV['RABBIT_HOST'],
                        port: ENV['RABBIT_PORT'] || 5672,
                        user: ENV['RABBIT_USER'],
                        password: ENV['RABBIT_PASS'])
      @conn.start
      @ch = @conn.create_channel
      @queue = @ch.queue(ENV['QUEUE_NAME'])
      @exchange = @ch.default_exchange
    end

    def push(data)
      @exchange.publish(data, routing_key: @queue.name)
    end

    def pop
      @queue.get.last
    end
  end
end
