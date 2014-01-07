describe Character do

  it 'has a name' do
    subject.name = 'Bob'
    expect(subject.name).to eq 'Bob'
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

    it 'has 5 hit points"' do
      expect(subject.hit_points).to eq 5
    end

    it 'is alive' do
      expect(subject.alive?).to be_true
    end

    it "isn't dead" do
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

    it 'hits on a roll greater than armor class' do
      expect(subject.attack defender, 15).to be_true
    end

    it 'misses on a roll less than armor class' do
      expect(subject.attack defender, 5).to be_false
    end

    it 'hits on a roll equal to armor class' do
      expect(subject.attack defender, 10).to be_true
    end

    it 'does a point of damage when attack hits' do
      subject.attack defender, 15
      expect(defender.hit_points).to eq 4
    end

    it 'does double damage on a roll of 20' do
      subject.attack defender, 20
      expect(defender.hit_points).to eq 3
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
