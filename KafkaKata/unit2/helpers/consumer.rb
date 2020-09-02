# frozen_string_literal: true

require 'kafka'

class Consumer
  def initialize
    seed_brokers = ['localhost:9092']
    @topic_name = 'topic-avro-timezones'
    @client = Kafka.new(seed_brokers)
  end

  def fetch
    records = @client.fetch_messages(topic: @topic_name, partition: 0, offset: :earliest)
    records.map(&:value)
  end

  def stop
    @client.close
  end
end
