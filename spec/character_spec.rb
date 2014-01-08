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
      expect(subject.armor_class).to eq 10
    end

    it 'has 5 hit points' do
      expect(subject.hit_points).to eq 5
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
        @hit = subject.attack defender, 5
      end

      it 'misses' do
        expect(@hit).to be_false
      end

      it 'does no damage to defender' do
        expect(defender.hit_points).to eq 5
      end

    end

    context 'and roll is greater than armor class' do

      before :each do
        @hit = subject.attack defender, 15
      end

      it 'hits' do
        expect(@hit).to be_true
      end

      it 'does a point of damage to the defender' do
        expect(defender.hit_points).to eq 4
      end

    end

    context 'and roll is equal to armor class' do

      before :each do
        @hit = subject.attack defender, 10
      end

      it 'hits' do
        expect(@hit).to be_true
      end

      it 'does a point of damage to the defender' do
        expect(defender.hit_points).to eq 4
      end

    end

    context 'and roll is a natural 20' do

      before :each do
        @hit = subject.attack defender, 20
      end

      it 'hits' do
        expect(@hit).to be_true
      end

      it 'does double damage on a roll of 20' do
        expect(defender.hit_points).to eq 3
      end

    end

  end

  context 'when damaged' do

    context 'and hit points are positive' do

      before :each do
        4.times { subject.damage }
      end

      it 'is alive' do
        expect(subject.alive?).to be_true
      end

      it "isn't dead" do
        expect(subject.dead?).to be_false
      end

    end

    context 'and hit points are zero' do

      before :each do
        5.times { subject.damage }
      end

      it 'is alive' do
        expect(subject.alive?).to be_false
      end

      it "isn't dead" do
        expect(subject.dead?).to be_true
      end

    end

    context 'and hit points are negative' do

      before :each do
        10.times { subject.damage }
      end

      it 'is alive' do
        expect(subject.alive?).to be_false
      end

      it "isn't dead" do
        expect(subject.dead?).to be_true
      end

    end

  end

end

