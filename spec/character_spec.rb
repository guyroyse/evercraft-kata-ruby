describe Character do

  it 'has a name' do
    subject.name = 'Bob'
    expect(subject.name).to eq 'Bob'
  end

  it 'has expected abilities' do
    expect(subject.strength).to be_instance_of Ability
    expect(subject.dexterity).to be_instance_of Ability
    expect(subject.constitution).to be_instance_of Ability
    expect(subject.intelligence).to be_instance_of Ability
    expect(subject.wisdom).to be_instance_of Ability
    expect(subject.charisma).to be_instance_of Ability
  end

  context 'when setting alignment' do

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

  end

end

