# frozen_string_literal: true

RSpec.describe RSpecFileFixtures::Fixture do
  subject(:fixture) { described_class.new(path) }

  let(:path) { 'example.json' }

  it { is_expected.to be_a described_class }

  its(:read) { is_expected.to eql %({"key":"value"}\n) }
  its(:path) { is_expected.to eql File.expand_path(File.join('spec', 'fixtures', 'example.json')) }

  context 'json' do
    let(:path) { 'example.json' }
    its(:json) { is_expected.to eql(key: 'value') }
    it 'does not symbolize names when `symbolize_names` parameter is false' do
      expect(subject.json(symbolize_names: false)['key']).to eql 'value'
    end

    it 'does not symbolize names when shorthand `symbolize_names` parameter is false' do
      expect(subject.json(false)['key']).to eql 'value'
    end
  end

  context 'yaml' do
    let(:path) { 'example.yaml' }
    its(:yaml) { is_expected.to eql(key: 'value') }
    its(:yml) { is_expected.to eql fixture.yaml }
    it 'does not symbolize names when `symbolize_names` parameter is false' do
      expect(subject.yml(symbolize_names: false)['key']).to eql 'value'
    end

    it 'does not symbolize names when shorthand `symbolize_names` parameter is false' do
      expect(subject.yml(false)['key']).to eql 'value'
    end
  end

  context 'xml' do
    let(:path) { 'example.xml' }
    it 'parses xml' do
      expect(fixture.xml).to be_a Nokogiri::XML::Document
    end
  end

  context 'file does not exist' do
    let(:path) { 'nonsense.brk' }
    its(:path) { is_expected.to eql File.expand_path(File.join('spec', 'fixtures', 'nonsense.brk')) }
  end
end
