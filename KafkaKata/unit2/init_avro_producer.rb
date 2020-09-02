# frozen_string_literal: true

require 'avro'
require_relative './helpers/producer.rb'

timezones = JSON.parse(File.read('./json/timezones.json'))
schema_json = JSON.parse(File.read('./json/schema.json')).to_json
schema = Avro::Schema.parse(schema_json)
writer = Avro::IO::DatumWriter.new(schema)

serialized_timezones = timezones.map do |timezone|
  buffer = StringIO.new
  encoder = Avro::IO::BinaryEncoder.new(buffer)
  writer.write(timezone.transform_keys(&:to_s), encoder)
  buffer.string
end

producer = Producer.new
serialized_timezones.each do |timezone|
  producer.produce(timezone)
end
producer.deliver_messages
producer.stop
