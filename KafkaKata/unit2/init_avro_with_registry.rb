# frozen_string_literal: true

require 'avro_turf/messaging'
require_relative './helpers/kafka_client.rb'

timezones = JSON.parse(File.read('./data/timezones.json'))
avro = AvroTurf::Messaging.new(registry_url: 'http://localhost:21000', schemas_path: './data')
client = KafkaClient.new('topic-avro-turf3')

timezones.map do |timezone|
  message = avro.encode(timezone, schema_name: 'TimeZone')
  client.produce(message)
end
client.deliver_messages

results = client.fetch
deserialized_results = results.map { |rv| avro.decode rv }
p deserialized_results
