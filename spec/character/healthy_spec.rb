describe Character, 'when healthy' do

  before :each do
    subject.constitution.score = 12
  end

  it 'adds constitution modifier to hit points' do
    expect(subject.hit_points).to eq DEFAULT_HIT_POINTS + 1
  end

end

