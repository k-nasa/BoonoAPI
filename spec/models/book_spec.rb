require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validates' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :publish_date }
  end
end
