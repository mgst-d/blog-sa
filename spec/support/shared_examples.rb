require 'rspec/mocks'

RSpec.shared_examples 'factorized model' do |_attrs|
  it 'has valid factory' do
    expect(FactoryBot.build(described_class.to_s.underscore.to_sym)).to be_valid
    create(described_class.to_s.underscore.to_sym)
  end
end