# frozen_string_literal: true

require 'avro'
require_relative './helpers/kafka_client.rb'

schema_json = JSON.parse(File.read('./json/schema.json')).to_json
schema = Avro::Schema.parse(schema_json)
reader = Avro::IO::DatumReader.new(schema)

client = KafkaClient.new
results = client.fetch
client.stop

parsed_results = results.map do |message|
  decoder = Avro::IO::BinaryDecoder.new(StringIO.new(message))
  reader.read(decoder)
end

puts 'Parsed avro is:'
p parsed_results
