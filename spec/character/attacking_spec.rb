describe Character, 'when attacking' do

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

  context 'and hitting' do

    before :each do
      allow(defender).to receive(:armor_class).and_return DIE_ROLL
      subject.attack defender, DIE_ROLL
    end

    it 'gains 10 experience points' do
      expect(subject.experience_points).to eq 10
    end

    context 'and attacking and hitting again' do

      before :each do
        subject.attack defender, DIE_ROLL
      end

      it 'gains 10 more experience points' do
        expect(subject.experience_points).to eq 20
      end

    end

  end

  it 'applies attack modifier to attack rolls' do
    allow(defender).to receive(:armor_class).and_return DIE_ROLL - 5
    expect(subject).to receive(:attack_modifier) { 5 }
    subject.attack defender, DIE_ROLL
  end

end

