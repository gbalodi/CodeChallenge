FactoryGirl.define do
  factory :pageview do |pageview|
  	#visit = FactoryGirl.create(:visit)
    #pageview.visit_id visit.id
    pageview.title "Vehicle Loan Information"
    pageview.position "1"
    pageview.url "https://apptest.loanspq.com/vl/VehicleLoan.aspx/vehicle-loan-information?lenderref=Meriwest_test&l=1"
    pageview.time_spent "1"
    pageview.timestamp 1537623918
  end
end
