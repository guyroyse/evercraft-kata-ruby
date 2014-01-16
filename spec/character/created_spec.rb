describe Character, 'when created' do

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

  it 'has no experience' do
    expect(subject.experience_points).to eq 0
  end

  it 'is first level' do
    expect(subject.level).to eq 1
  end

  it 'has an attack modifier of 0' do
    expect(subject.attack_modifier).to eq 0
  end

end

