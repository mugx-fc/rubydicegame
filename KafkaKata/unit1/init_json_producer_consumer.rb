# frozen_string_literal: true

require 'kafka'
require 'json'

seed_brokers = ['localhost:9092']
topic_name = 'topic-json'
group_id = 'my-kafka-group'

client = Kafka.new(seed_brokers)

# producer
puts("\nProducer is sending: ")
strings = IO.readlines('strings.txt', chomp: true).map do |str|
  { fragment: str[0..9], full_len: str.length }
end
strings.map(&:to_json).each do |string|
  puts(string)
  client.deliver_message(string, topic: topic_name)
end

# consumer
consumer = client.consumer(group_id: group_id)
consumer.subscribe(topic_name)
records = client.fetch_messages(topic: 'json', partition: 0, offset: :earliest)

puts("\nConsumer received: ")
records.each do |record|
  puts(JSON.parse(record.value, symbolize_names: true))
end
