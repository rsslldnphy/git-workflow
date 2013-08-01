require 'cat'

describe Cat do

  let (:cat) { Cat.new }

  it 'can talk' do
    expect(cat.talk).to eq "MIAOW!"
  end

  it 'can purr' do
    expect(cat.purr).to eq "PURRRRR!"
  end
end
