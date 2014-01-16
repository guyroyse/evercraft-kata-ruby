describe Character, 'when strong' do

  before :each do
    subject.strength.score = 12
  end

  context 'and attacking' do

    let :defender do
      double('defender')
    end

    before :each do
      allow(defender).to receive(:armor_class).and_return DIE_ROLL + 1
      allow(defender).to receive(:damage)
    end

    context 'and hitting' do

      before :each do
        @hit = subject.attack defender, DIE_ROLL
      end

      it 'adds strength modifier to attack rolls' do
        expect(@hit).to be_true
      end

      it 'adds strength modifier to damage' do
        expect(defender).to have_received(:damage).with STRONG_DAMAGE
      end

    end

    context 'and hitting critically' do

      before :each do
        subject.attack defender, CRITICAL_ROLL
      end

      it 'adds double strength modifier on a critical hit' do
        expect(defender).to have_received(:damage).with STRONG_DAMAGE * 2
      end

    end

  end

end

