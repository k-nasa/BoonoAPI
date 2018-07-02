require 'rails_helper'

RSpec.describe NotifyBook, type: :model do
  describe 'validates' do
    it { is_expected.to validate_presence_of :book }
    it { is_expected.to validate_presence_of :user }
  end
end
