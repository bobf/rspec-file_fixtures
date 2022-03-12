# frozen_string_literal: true

RSpec.describe RSpecFileFixtures::Fixture do
  subject(:fixture) { described_class.new(path) }

  let(:path) { 'example.json' }

  it { is_expected.to be_a described_class }

  its(:read) { is_expected.to eql %({"key":"value"}\n) }
  its(:path) { is_expected.to eql File.expand_path(File.join('spec', 'fixtures', 'example.json')) }

  context 'json' do
    let(:path) { 'example.json' }
    its(:from_json) { is_expected.to eql(key: 'value') }
    it 'does not symbolize names when `symbolize_names` parameter is false' do
      expect(subject.from_json(symbolize_names: false)['key']).to eql 'value'
    end

    it 'does not symbolize names when shorthand `symbolize_names` parameter is false' do
      expect(subject.from_json(false)['key']).to eql 'value'
    end
    its(:from_json) { is_expected.to eql subject.json }
  end

  context 'yaml' do
    let(:path) { 'example.yaml' }
    its(:yaml) { is_expected.to eql(key: 'value') }
    its(:from_yml) { is_expected.to eql fixture.from_yaml }
    it 'does not symbolize names when `symbolize_names` parameter is false' do
      expect(subject.from_yml(symbolize_names: false)['key']).to eql 'value'
    end

    it 'does not symbolize names when shorthand `symbolize_names` parameter is false' do
      expect(subject.from_yml(false)['key']).to eql 'value'
    end
    its(:from_yaml) { is_expected.to eql subject.yaml }
    its(:from_yml) { is_expected.to eql subject.yml }
  end

  context 'xml' do
    let(:path) { 'example.xml' }
    it 'parses xml' do
      expect(fixture.from_xml).to be_a Nokogiri::XML::Document
    end
    its('from_xml.to_xml') { is_expected.to eql subject.xml.to_xml }
  end

  context 'file does not exist' do
    let(:path) { 'nonsense.brk' }
    its(:path) { is_expected.to eql File.expand_path(File.join('spec', 'fixtures', 'nonsense.brk')) }
  end
end
