require 'rails_helper'

RSpec.describe Business, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "must have a name" do
    business = Business.new
    expect(business.valid?).to eq false
  end

  it 'must have a telephone number' do
    business = Business.new(name: 'sams pizza')
    expect(business.valid?).to eq false
  end

  context 'no image url' do

    it 'defaults to placeholder image url' do

      business = Business.new(name: 'sams pizza', display_phone: '222 2222')
      expect(business.image_url).to eq 'http://lorempixel.com/output/abstract-q-c-500-350-5.jpg'
    end

  end

end
