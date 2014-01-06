describe Character do

  it 'has a name' do
    subject.name = 'Bob'
    expect(subject.name).to eq 'Bob'
  end

  it 'no name when created' do
    expect(subject.name).to be_nil
  end

  it 'has an alignment' do
    subject.alignment = :good
    expect(subject.alignment).to eq :good
  end

  it 'is neutral when created' do
    expect(subject.alignment).to eq :neutral
  end

end
