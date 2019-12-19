require 'rails_helper'

RSpec.describe SnackMachine, type: :model do
  describe 'relationships' do
    it { should belong_to :owner }
    it { should belong_to :snacks}
  end
end
