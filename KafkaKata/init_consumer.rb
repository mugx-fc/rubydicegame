# frozen_string_literal: true

require 'kafka'

seed_brokers = ['localhost:9092']
topic_name = 'topic-strings'

client = Kafka.new(seed_brokers)
puts "Listening to #{client.topics}"

records = client.fetch_messages(topic: topic_name, partition: 0, offset: :earliest)
puts "Fetching messages from: #{topic_name}"

p(records.map(&:value))

client.close
