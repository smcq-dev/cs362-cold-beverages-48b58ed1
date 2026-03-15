require_relative '../lib/item'

describe 'An item of food or a beverage' do
  let (:item) { Item.new('TEST', 100) }

  it 'has a name attribute' do
    expect(item.name).to eq('TEST')
  end

  it 'has a volume attribute' do
    expect(item.volume).to eq(100)
  end
  
end
