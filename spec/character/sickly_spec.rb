describe Character, 'when sickly' do

  before :each do
    subject.constitution.score = 8
  end

  it 'adds constitution modifier to hit points' do
    expect(subject.hit_points).to eq DEFAULT_HIT_POINTS - 1
  end

  it 'always has at least one hit point' do
    subject.constitution.score = 1
    expect(subject.hit_points).to eq 1
  end

end

