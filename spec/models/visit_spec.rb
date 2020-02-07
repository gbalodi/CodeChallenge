require 'rails_helper'

RSpec.describe Visit, type: :model do
  subject {    
    visit = FactoryGirl.build_stubbed(:visit)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without evid" do
    subject.evid = nil
    expect(subject).to_not be_valid
  end

  it "is not valid if evid format is not matched" do
    subject.evid = "invalid evid"
    expect(subject).to_not be_valid
  end

  it "is not valid without vendor_site_id" do
    subject.vendor_site_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without vendor_visit_id" do
    subject.vendor_visit_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without visit_ip" do
    subject.visit_ip = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without vendor_visitor_id" do
    subject.vendor_visitor_id = nil
    expect(subject).to_not be_valid
  end
end
