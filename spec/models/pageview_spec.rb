require 'rails_helper'

RSpec.describe Pageview, type: :model do
  subject {
    visit = FactoryGirl.create(:visit)
    pageview = FactoryGirl.create(:pageview, visit_id: visit.id)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a visit_id" do
    subject.visit_id = nil
    expect(subject).to_not be_valid
  end
end
