describe Character do

  it 'has a name' do
    subject.name = 'Bob'
    expect(subject.name).to eq 'Bob'
  end

  it 'can be good' do
    subject.alignment = :good
    expect(subject.alignment).to eq :good
  end

  it 'can be neutral' do
    subject.alignment = :neutral
    expect(subject.alignment).to eq :neutral
  end

  it 'can be evil' do
    subject.alignment = :evil
    expect(subject.alignment).to eq :evil
  end

  it 'cannot be phlegmatic' do
    expect { subject.alignment = :phlegmatic }.to raise_error
  end

  context 'when attacking' do

    let(:defender) { Character.new }

    it 'hits on a roll great than armor class' do
      expect(subject.attack defender, 15).to be_true
    end

  end

  context 'when created' do

    it 'has no name' do
      expect(subject.name).to be_nil
    end

    it 'is neutral' do
      expect(subject.alignment).to eq :neutral
    end

    it 'has an armor class of 10' do
      expect(subject.armor_class).to eq 10
    end

    it 'has 5 hit points"' do
      expect(subject.hit_points).to eq 5
    end

  end

end
