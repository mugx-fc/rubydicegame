# frozen_string_literal: true

# this code works with the following registry: https://github.com/salsify/avro-schema-registry

require 'avro_turf/messaging'
require_relative './helpers/kafka_client.rb'

timezones = JSON.parse(File.read('./data/timezones.json'))
avro = AvroTurf::Messaging.new(registry_url: 'http://localhost:21000', schemas_path: './data')
client = KafkaClient.new('topic-avro-turf')

# producer
puts 'Sending content of timezones.json as avro with registry:'
timezones.map do |timezone|
  message = avro.encode(timezone, schema_name: 'TimeZone')
  client.produce(message)
end
client.deliver_messages

# consumer
results = client.fetch
deserialized_results = results.map { |record| avro.decode record }
client.stop

puts 'Parsed avro is:'
p deserialized_results
