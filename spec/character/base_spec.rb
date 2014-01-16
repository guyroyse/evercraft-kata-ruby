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

  context 'when attacking' do

    let :defender do
      double('defender')
    end

    before :each do
      allow(defender).to receive(:damage)
    end

    context 'and roll is less than armor class' do

      before :each do
        allow(defender).to receive(:armor_class).and_return DIE_ROLL + 1
        @hit = subject.attack defender, DIE_ROLL
      end

      it 'misses' do
        expect(@hit).to be_false
      end

      it 'does no damage to defender' do
        expect(defender).to_not have_received(:damage)
      end

    end

    context 'and roll is greater than armor class' do

      before :each do
        allow(defender).to receive(:armor_class).and_return DIE_ROLL - 1
        @hit = subject.attack defender, DIE_ROLL
      end

      it 'hits' do
        expect(@hit).to be_true
      end

      it 'does a point of damage to the defender' do
        expect(defender).to have_received(:damage).with DEFAULT_DAMAGE
      end

    end

    context 'and roll is equal to armor class' do

      before :each do
        allow(defender).to receive(:armor_class).and_return DIE_ROLL
        @hit = subject.attack defender, DIE_ROLL
      end

      it 'hits' do
        expect(@hit).to be_true
      end

      it 'does a point of damage to the defender' do
        expect(defender).to have_received(:damage).with DEFAULT_DAMAGE
      end

    end

    context 'and roll is a natural 20' do

      before :each do
        allow(defender).to receive(:armor_class).and_return DIE_ROLL
        @hit = subject.attack defender, CRITICAL_ROLL
      end

      it 'hits' do
        expect(@hit).to be_true
      end

      it 'does double damage to the defender' do
        expect(defender).to have_received(:damage).with DEFAULT_DAMAGE * 2
      end

    end

  end

end

