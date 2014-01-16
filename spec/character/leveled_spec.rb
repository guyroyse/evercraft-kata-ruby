describe Character, 'when leveled' do

  let :defender do
    double('defender')
  end

  before :each do
    allow(defender).to receive(:armor_class).and_return DIE_ROLL
    allow(defender).to receive(:damage)
  end

  context 'when second level' do

    before :each do
      100.times { subject.attack defender, DIE_ROLL } 
    end

    it 'receives a +1 to attack' do
      expect(subject.attack_modifier).to eq 1
    end

  end

  context 'when third level' do

    before :each do
      200.times { subject.attack defender, DIE_ROLL } 
    end

    it 'received additional hit points' do
      expect(subject.hit_points).to eq DEFAULT_HIT_POINTS * 3
    end

    it 'received additional hit points for constitution modifier' do
      subject.constitution.score = 12
      expect(subject.hit_points).to eq (DEFAULT_HIT_POINTS + 1) * 3
    end

    it 'lost additional hit points for constitution modifier' do
      subject.constitution.score = 8
      expect(subject.hit_points).to eq (DEFAULT_HIT_POINTS - 1) * 3
    end

    it 'receives at least one hit point per level' do
      subject.constitution.score = 1
      expect(subject.hit_points).to eq 3
    end

    it 'receives a +1 to attack' do
      expect(subject.attack_modifier).to eq 1
    end

  end

  context 'when fourth level' do

    before :each do
      300.times { subject.attack defender, DIE_ROLL } 
    end

    it 'receives a +1 to attack' do
      expect(subject.attack_modifier).to eq 2
    end

  end

end

