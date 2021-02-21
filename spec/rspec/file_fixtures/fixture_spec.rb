# frozen_string_literal: true

RSpec.describe RSpec::FileFixtures::Fixture do
  subject(:fixture) { described_class.new(path) }

  let(:path) { 'example.json' }

  it { is_expected.to be_a described_class }

  its(:read) { is_expected.to eql %({"key":"value"}\n) }
  its(:path) { is_expected.to eql File.expand_path(File.join('spec', 'fixtures', 'example.json')) }

  context 'json' do
    let(:path) { 'example.json' }
    its(:json) { is_expected.to eql(key: 'value') }
  end

  context 'yaml' do
    let(:path) { 'example.yaml' }
    its(:yaml) { is_expected.to eql(key: 'value') }
    its(:yml) { is_expected.to eql fixture.yaml }
  end

  context 'xml' do
    let(:path) { 'example.xml' }
    it 'parses xml' do
      expect(fixture.xml).to be_a Nokogiri::XML::Document
    end
  end
end
