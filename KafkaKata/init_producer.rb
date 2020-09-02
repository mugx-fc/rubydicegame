# frozen_string_literal: true

require 'kafka'

seed_brokers = ['localhost:9092']
topic_name = 'topic-strings'

client = Kafka.new(seed_brokers)
producer = client.producer

IO.readlines('strings.txt', chomp: true).each do |string|
  puts("\nSending to '#{topic_name}':\n#{string}\n\n")
  producer.produce(string, topic: topic_name)
end
producer.deliver_messages

producer.shutdown
client.close
