require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { build(:book) }

  it { expect(book).to be_valid }

  describe 'validates' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:detail_url) }
    it { is_expected.to validate_presence_of(:publish_date) }
  end
end
