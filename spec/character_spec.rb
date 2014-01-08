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

  context 'when created' do

    it 'has no name' do
      expect(subject.name).to be_nil
    end

    it 'is neutral' do
      expect(subject.alignment).to eq :neutral
    end

    it 'has an armor class of 10' do
      expect(subject.armor_class).to eq DEFAULT_ARMOR_CLASS
    end

    it 'has 5 hit points' do
      expect(subject.hit_points).to eq DEFAULT_HIT_POINTS
    end

    it 'is alive' do
      expect(subject.alive?).to be_true
    end

    it 'is not dead' do
      expect(subject.dead?).to be_false
    end

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
      Character.new
    end

    context 'and roll is less than armor class' do

      before :each do
        @hit = subject.attack defender, MISS_ROLL
      end

      it 'misses' do
        expect(@hit).to be_false
      end

      it 'does no damage to defender' do
        expect(defender.hit_points).to eq DEFAULT_HIT_POINTS
      end

    end

    context 'and roll is greater than armor class' do

      before :each do
        @hit = subject.attack defender, HIT_ROLL
      end

      it 'hits' do
        expect(@hit).to be_true
      end

      it 'does a point of damage to the defender' do
        expect(defender.hit_points).to eq DEFAULT_HIT_POINTS - DEFAULT_DAMAGE
      end

    end

    context 'and roll is equal to armor class' do

      before :each do
        @hit = subject.attack defender, JUST_HIT_ROLL
      end

      it 'hits' do
        expect(@hit).to be_true
      end

      it 'does a point of damage to the defender' do
        expect(defender.hit_points).to eq DEFAULT_HIT_POINTS - DEFAULT_DAMAGE
      end

    end

    context 'and roll is a natural 20' do

      before :each do
        @hit = subject.attack defender, CRITICAL_ROLL
      end

      it 'hits' do
        expect(@hit).to be_true
      end

      it 'does double damage to the defender' do
        expect(defender.hit_points).to eq DEFAULT_HIT_POINTS - DEFAULT_DAMAGE * 2
      end

    end

  end

  context 'when damaged' do

    context 'and hit points are positive' do

      before :each do
        (DEFAULT_HIT_POINTS - 1).times { subject.damage }
      end

      it 'is alive' do
        expect(subject.alive?).to be_true
      end

      it 'is not dead' do
        expect(subject.dead?).to be_false
      end

    end

    context 'and hit points are zero' do

      before :each do
        DEFAULT_HIT_POINTS.times { subject.damage }
      end

      it 'is not alive' do
        expect(subject.alive?).to be_false
      end

      it 'is dead' do
        expect(subject.dead?).to be_true
      end

    end

    context 'and hit points are negative' do

      before :each do
        (DEFAULT_HIT_POINTS + 1).times { subject.damage }
      end

      it 'is not alive' do
        expect(subject.alive?).to be_false
      end

      it 'is dead' do
        expect(subject.dead?).to be_true
      end

    end

  end

end

