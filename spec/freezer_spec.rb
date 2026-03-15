require_relative '../lib/freezer'
require_relative '../lib/item'

describe 'A freezer' do
  let(:freezer) { Freezer.new(100) }
  let(:ice_cream) { Item.new('ice cream', 5) }
  let(:chicken) { Item.new('chicken', 30) }

  it 'has a capacity attribute' do
    expect(freezer.capacity).to eq(100)
  end

  it 'has a temperature attribute' do
    expect(freezer.temperature).to eq(70)
  end

  it 'can be turned on' do
    expect { freezer.turn_on }.not_to raise_error
  end

  it 'can be turned off' do
    freezer.turn_on
    expect { freezer.turn_off }.not_to raise_error
  end

  it 'can add an item' do
    expect { freezer.add(ice_cream) }.not_to raise_error
  end

  it 'can check the remaining capacity' do
    freezer.add(chicken)
    freezer.add(ice_cream)
    expect(freezer.remaining_capacity).to eq(65)
  end

  it 'can set the freezer temperature' do
    freezer.set_level(5)
    expect(freezer.temperature).to eq(20)
  end

end
