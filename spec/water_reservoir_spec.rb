require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  let(:reservoir) { WaterReservoir.new(10, 0)}

  it 'has a capacity attribute' do
    expect(reservoir.capacity).to eq(10)
  end

  it 'has a current_water_volume attribute' do
    expect(reservoir.current_water_volume).to eq(0)
  end

end
