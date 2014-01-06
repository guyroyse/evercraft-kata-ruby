describe Character do

  it 'has a name' do
    subject.name = 'Bob'
    expect(subject.name).to eq 'Bob'
  end

  it 'no name when created' do
    expect(subject.name).to be_nil
  end

end
