# frozen_string_literal: true

require 'avro'
require_relative './helpers/consumer.rb'

schema_json = JSON.parse(File.read('./json/schema.json')).to_json

consumer = Consumer.new
results = consumer.fetch
consumer.stop

reader = Avro::IO::DatumReader.new(schema_json)
parsed_json = results.each do |message|
  decoder = Avro::IO::BinaryDecoder.new(StringIO.new(message))

  h = reader.read(decoder)
  p h
  h.transform_keys(&:to_sym)
end
p parsed_json
