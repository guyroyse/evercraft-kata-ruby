describe Character, 'when damaged' do

  context 'and hit points are positive' do

    before :each do
      subject.damage DEFAULT_HIT_POINTS - 1
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
      subject.damage DEFAULT_HIT_POINTS
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
      subject.damage DEFAULT_HIT_POINTS + 1
    end

    it 'is not alive' do
      expect(subject.alive?).to be_false
    end

    it 'is dead' do
      expect(subject.dead?).to be_true
    end

  end

end

