# frozen_string_literal: true

def test_case(logo)
  unless ARGV.include?('TEST')
    puts logo unless logo.empty?
    yield 
  end
end
