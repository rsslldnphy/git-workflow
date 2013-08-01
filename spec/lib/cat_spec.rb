require 'cat'

describe Cat do
  it 'can talk' do
    expect(Cat.new.talk).to eq "MIAOW!"
  end
end
