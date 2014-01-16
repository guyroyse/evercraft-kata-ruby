describe Character, 'when fast' do

  before :each do
    subject.dexterity.score = 12
  end

  it 'adds dexterity modifier to armor class' do
    expect(subject.armor_class).to eq DEFAULT_ARMOR_CLASS + 1
  end

end

