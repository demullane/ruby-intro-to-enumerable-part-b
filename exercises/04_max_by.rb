# def max_by(items, &block)
#   if items == []
#     return nil
#   else
#     result = {"#{block.call(items[0])}": items[0]}
#     items.each do |item|
#       result = {"#{block.call(item)}": item} if block.call(item) > result.map{|k,v| k.to_s.to_i}[0]
#     end
#     return result.map{|k,v| v}[0]
#   end
# end

def max_by(items, &block)
  if items == []
    return nil
  else
    result = items[0]
    items.each do |item|
      result = item if block.call(item) > block.call(result)
    end
    return result
  end
end

# ------ code above this line ------

require 'rspec/autorun'

RSpec.describe '#max_by' do
  it 'returns the longest word in an array' do
    input = ['a', 'big', 'black', 'bear', 'is', 'running']

    expect(max_by(input) { |word| word.length }).to eq('running')
  end

  it 'returns the first longest word if there are multiples' do
    input = ['fa', 'la']

    expect(max_by(input) { |word| word.length }).to eq('fa')
  end

  it 'returns the largest number in the list by comparing the numbers' do
    input = [1, 2, 512, 4, 256, 8]

    expect(max_by(input) { |num| num }).to eq(512)
  end

  it 'returns nil when given an empty array, regardless of the given block' do
    expect(max_by([]) { |foos| foos.foo_method }).to eq(nil)
  end
end
