require_relative '../lib/refrigerator'
require_relative '../lib/chiller'
require_relative '../lib/freezer'
require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'
require_relative '../lib/item'
require_relative '../lib/vessel'

describe 'A refrigerator' do
  let(:water_reservoir) { WaterReservoir.new(100, 0) }
  let(:water_dispenser) { WaterDispenser.new(water_reservoir) }
  let(:chiller) { Chiller.new() }
  let(:freezer) { Freezer.new() }
  let(:refrigerator) { Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir) }
  let(:ice_cream) { Item.new('ice cream', 5) }
  let(:chicken) { Item.new('chicken', 30) }

  it 'has a chiller attribute' do
    expect(refrigerator.chiller).to eq(chiller)
  end

  it 'has a freezer attribute' do
    expect(refrigerator.freezer).to eq(freezer)
  end

  it 'has a water_dispenser attribute' do
    expect(refrigerator.water_dispenser).to eq(water_dispenser)
  end

  it 'has a water_reservoir attribute' do
    expect(refrigerator.water_reservoir).to eq(water_reservoir)
  end

  it 'can chill an item' do
    refrigerator.chill(chicken)
    expect(chiller.remaining_capacity).to eq(70)
  end

  it 'can freeze an item' do
    refrigerator.freeze(ice_cream)
    expect(freezer.remaining_capacity).to eq(95)
  end

  it 'can check the total capacity of the fridge' do
    expect(refrigerator.total_capacity).to eq(200)
  end

  it 'can check the total remaining capacity of the fridge' do
    refrigerator.chill(chicken)
    refrigerator.freeze(chicken)
    refrigerator.freeze(ice_cream)
    expect(refrigerator.remaining_capacity).to eq(135)
  end

  it 'can plug in the refrigerator' do
    expect { refrigerator.plug_in }.not_to raise_error
  end

  it 'can unplug refrigerator' do
    refrigerator.plug_in
    expect { refrigerator.unplug }.not_to raise_error
  end

  it 'can set the chiller temperature' do
    refrigerator.set_chiller_level(5)
    expect(chiller.temperature).to eq(45)
  end

  it 'can set the freezer temperature' do
    refrigerator.set_freezer_level(5)
    expect(freezer.temperature).to eq(20)
  end

  it 'can report its status' do
    expect(refrigerator.to_s).to include('Power: off')
    expect(refrigerator.to_s).to include('Water: Reservoir has 0 remaining')
    expect(refrigerator.to_s).to include('Storage: 200 of 200')
  end

end
