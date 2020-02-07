class Pageview < ApplicationRecord
  belongs_to :visit

  def as_json(options = {})
  	{
	  'url'       => url,
	  'pagetitle' => title,
	  'timespent' => time_spent,
	  'timestamp' => timestamp
  	}
  end
end
