describe Character, 'when damaged' do

  context 'with less points than it has' do

    before :each do
      subject.damage DEFAULT_HIT_POINTS - 1
    end

    it 'has positive current hit points' do
      expect(subject.current_hit_points).to eq 1
    end

    it 'is alive' do
      expect(subject.alive?).to be_true
    end

    it 'is not dead' do
      expect(subject.dead?).to be_false
    end

  end

  context 'with as many hit points as it has' do

    before :each do
      subject.damage DEFAULT_HIT_POINTS
    end

    it 'has no current hit points' do
      expect(subject.current_hit_points).to eq 0
    end

    it 'is not alive' do
      expect(subject.alive?).to be_false
    end

    it 'is dead' do
      expect(subject.dead?).to be_true
    end

  end

  context 'with more hit points than it has' do

    before :each do
      subject.damage DEFAULT_HIT_POINTS + 1
    end

    it 'has negative current hit points' do
      expect(subject.current_hit_points).to eq -1
    end

    it 'is not alive' do
      expect(subject.alive?).to be_false
    end

    it 'is dead' do
      expect(subject.dead?).to be_true
    end

  end

end

