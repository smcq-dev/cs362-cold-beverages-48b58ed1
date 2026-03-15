require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'
require_relative '../lib/vessel'

describe 'A water dispenser' do
  let(:reservoir) { WaterReservoir.new(10, 10) }
  let(:water_dispenser) { WaterDispenser.new(reservoir)}
  let(:vessel) { Vessel.new('Mug', 5) }

  it 'has a reservoir attribute' do
    expect(water_dispenser.reservoir).to eq(reservoir)
  end

  it 'can dispense water into a vessel' do
    water_dispenser.dispense(vessel)
    expect(reservoir.current_water_volume).to eq(5)
  end

  it 'can fill a water reservoir' do
    water_dispenser.fill
    expect(reservoir.current_water_volume).to eq(reservoir.capacity)
  end

end
