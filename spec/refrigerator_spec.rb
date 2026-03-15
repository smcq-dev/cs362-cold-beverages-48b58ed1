require_relative '../lib/refrigerator'
require_relative '../lib/chiller'
require_relative '../lib/freezer'
require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'

describe 'A refrigerator' do
  let(:water_reservoir) { WaterReservoir.new(100, 0) }
  let(:water_dispenser) { WaterDispenser.new(water_reservoir) }
  let(:chiller) { Chiller.new() }
  let(:freezer) { Freezer.new() }
  let(:refrigerator) { Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir) }

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

end
