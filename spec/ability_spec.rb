describe Ability do

  it 'has a default score of 10' do
    expect(subject.score).to eq 10
  end

  it 'has a setable score' do
    subject.score = 15
    expect(subject.score).to be 15
  end

  it 'can have a score of 1' do
    expect { subject.score = 1 }.not_to raise_error 
  end

  it 'can have a score of 20' do
    expect { subject.score = 20 }.not_to raise_error 
  end

  it 'cannot have a score less than 1' do
    expect { subject.score = 0 }.to raise_error 
  end

  it 'cannot have a score greater than 20' do
    expect { subject.score = 21 }.to raise_error 
  end

end

