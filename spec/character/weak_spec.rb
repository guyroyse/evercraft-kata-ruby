describe Character, 'when weak' do

  before :each do
    subject.strength.score = 8
  end

  context 'and attacking' do

    let :defender do
      double('defender')
    end

    before :each do
      allow(defender).to receive(:armor_class).and_return DIE_ROLL
      allow(defender).to receive(:damage)
    end

    it 'misses on a just hit roll' do
      hit = subject.attack defender, DIE_ROLL
      expect(hit).to be_false
    end

    context 'and hitting' do

      before :each do
        allow(defender).to receive(:armor_class).and_return DIE_ROLL - 1
        @hit = subject.attack defender, DIE_ROLL
      end

      it 'adds strength modifier to hit rolls' do
        expect(@hit).to be_true
      end

      it 'does at least one point of damange' do
        expect(defender).to have_received(:damage).with MINIMUM_DAMAGE
      end

    end

    context 'and hitting critically' do

      before :each do
        subject.attack defender, CRITICAL_ROLL
      end

      it 'does at least one point of damage' do
        expect(defender).to have_received(:damage).with MINIMUM_DAMAGE
      end

    end

  end

end

