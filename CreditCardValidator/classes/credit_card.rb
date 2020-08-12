# frozen_string_literal: true

class CreditCard
  def initialize(number)
    @number = number.delete "\s"
  end

  def valid?
    valid_step?(sum_step(doubling_step))
  end

  def print_debug
    is_valid = valid?
    puts 'The credit card is valid' if is_valid
    puts 'The credit card is in not valid' unless is_valid
  end

  private

  def doubling_step
    doubled_number = Array.new(@number.size)
    (@number.size - 1).downto(0) do |i|
      doubled_number[i] = (@number[i].to_i * 2).modulo(9) if i.even?
      doubled_number[i] = @number[i].to_i if i.odd?
    end
    doubled_number
  end

  def sum_step(doubled_number)
    doubled_number.inject(:+)
  end

  def valid_step?(sum)
    (sum % 10).zero?
  end
end
