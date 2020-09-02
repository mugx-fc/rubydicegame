# frozen_string_literal: true

require 'kafka'

seed_brokers = ['localhost:9092']
topic_name = 'topic-strings'
group_id = 'my-kafka-group'

client = Kafka.new(seed_brokers)
consumer = client.consumer(group_id: group_id)
consumer.subscribe(topic_name)
puts("Listening to #{client.topics}")

consumer.each_message do |message|
  puts("Received: #{message.value}")
end

consumer.stop
client.close
