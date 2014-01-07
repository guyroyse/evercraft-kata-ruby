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

  context 'Ability Modifiers' do

    def verify_modifier score, modifier
      subject.score = score
      expect(subject.modifier).to eq modifier
    end

    it 'has a modifier of -5 for a score of 1' do
      verify_modifier 1, -5
    end

    it 'has a modifier of -1 for a score of 9' do
      verify_modifier 9, -1
    end

    it 'has a modifier of 0 for a score of 10' do
      verify_modifier 10, 0
    end

    it 'has a modifier of 0 for a score of 11' do
      verify_modifier 11, 0
    end

    it 'has a modifier of +1 for a score of 12' do
      verify_modifier 12, +1
    end

    it 'has a modifier of +5 for a score of 20' do
      verify_modifier 20, +5
    end

  end

end

