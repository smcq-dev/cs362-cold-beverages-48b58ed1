require_relative '../lib/chiller'
require_relative '../lib/item'

describe 'A chiller' do
  let(:chiller) { Chiller.new(100) }
  let(:ice_cream) { Item.new('ice cream', 5) }
  let(:chicken) { Item.new('chicken', 30) }

  it 'has a capacity attribute' do
    expect(chiller.capacity).to eq(100)
  end

  it 'has a temperature attribute' do
    expect(chiller.temperature).to eq(70)
  end

  it 'can be turned on' do
    expect { chiller.turn_on }.not_to raise_error
  end

  it 'can be turned off' do
    chiller.turn_on
    expect { chiller.turn_off }.not_to raise_error
  end

  it 'can add an item' do
    expect { chiller.add(ice_cream) }.not_to raise_error
  end

  it 'can check the remaining capacity' do
    chiller.add(chicken)
    chiller.add(ice_cream)
    expect(chiller.remaining_capacity).to eq(65)
  end

  it 'can set the chiller temperature' do
    chiller.set_level(5)
    expect(chiller.temperature).to eq(45)
  end

end
