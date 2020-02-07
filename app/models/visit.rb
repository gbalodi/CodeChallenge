class Visit < ApplicationRecord
  has_many :pageviews, dependent: :destroy
  accepts_nested_attributes_for :pageviews, reject_if: :all_blank

  validates :evid, :vendor_site_id, :vendor_visit_id, :visit_ip, :vendor_visitor_id, presence: true
  # The format needed to be changed, as \A is not working in ruby
  validates :evid, format: { with: /\w+[A-z0-9]{8}-[A-z0-9]{4}-[A-z0-9]{4}-[A-z0-9]{4}-[A-z0-9]{12}\z/, message: 'is invalid' }

  def as_json(options = {})
  	{
  	  'referrerName' => evid,
	  'idSite'       => vendor_site_id,
	  'idVisit'      => vendor_visit_id,
	  'visitIp'      => visit_ip,
	  'visitorId'   => vendor_visitor_id
  	}
  end
end
