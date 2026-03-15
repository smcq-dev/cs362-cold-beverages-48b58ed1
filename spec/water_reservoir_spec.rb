require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  let(:reservoir) { WaterReservoir.new(10, 0)}

  it 'has a capacity attribute' do
    expect(reservoir.capacity).to eq(10)
  end

  it 'has a current_water_volume attribute' do
    expect(reservoir.current_water_volume).to eq(0)
  end

  it 'is empty' do
    expect(reservoir).to be_empty
  end

  it 'can fill the reservoir with water' do
    reservoir.fill
    expect(reservoir.current_water_volume).to eq(reservoir.capacity)
  end

  it 'can drain the reservoir' do
    reservoir.fill
    reservoir.drain(5)
    expect(reservoir.current_water_volume).to eq(5)
  end

  it 'can not be empty' do
    reservoir.fill
    expect(reservoir).not_to be_empty
  end

end
