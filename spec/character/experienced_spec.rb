describe Character, 'when experienced' do

  let :defender do
    double('defender')
  end

  before :each do
    allow(defender).to receive(:armor_class).and_return DIE_ROLL
    allow(defender).to receive(:damage)
  end

  it 'is first level when it has 990 experience points' do
    99.times { subject.attack defender, DIE_ROLL } 
    expect(subject.level).to eq 1
  end

  it 'is second level when it has 1000 experience points' do
    100.times { subject.attack defender, DIE_ROLL } 
    expect(subject.level).to eq 2
  end

  it 'is third level when it has 2000 experience points' do
    200.times { subject.attack defender, DIE_ROLL } 
    expect(subject.level).to eq 3
  end

  it 'is tenth level when it has 9000 experience points' do
    900.times { subject.attack defender, DIE_ROLL } 
    expect(subject.level).to eq 10
  end

end
