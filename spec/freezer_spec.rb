require_relative '../lib/freezer'

describe 'A freezer' do
  let(:freezer) { Freezer.new(100)}

  it 'has a capacity attribute' do
    expect(freezer.capacity).to eq(100)
  end

  it 'has a temperature attribute' do
    expect(freezer.temperature).to eq(70)
  end

end
