# frozen_string_literal: true

require 'avro'
require_relative './helpers/kafka_client.rb'

timezones = JSON.parse(File.read('./json/timezones.json'))
schema_json = JSON.parse(File.read('./json/schema.json')).to_json
schema = Avro::Schema.parse(schema_json)
writer = Avro::IO::DatumWriter.new(schema)

serialized_timezones = timezones.map do |timezone|
  buffer = StringIO.new
  encoder = Avro::IO::BinaryEncoder.new(buffer)
  writer.write(timezone, encoder)
  buffer.string
end

client = KafkaClient.new
serialized_timezones.each do |timezone|
  client.produce(timezone)
end

puts 'Sending content of timezones.json as avro'
client.deliver_messages
client.stop
