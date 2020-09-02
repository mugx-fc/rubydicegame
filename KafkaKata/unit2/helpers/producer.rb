# frozen_string_literal: true

require 'kafka'

class Producer
  def initialize
    seed_brokers = ['localhost:9092']
    @topic_name = 'topic-avro-timezones'
    @client = Kafka.new(seed_brokers)
    @producer = @client.producer
  end

  def produce(message)
    @producer.produce(message, topic: @topic_name)
  end

  def deliver_messages
    @producer.deliver_messages
  end

  def stop
    @producer.shutdown
    @client.close
  end
end
