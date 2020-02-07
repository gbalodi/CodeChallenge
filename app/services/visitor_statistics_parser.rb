class VisitorStatisticsParser
  STATISTICS_URI = 'http://localhost:3000/visitor_statistics'

  class << self
  	def fetch_and_save
  	  begin
        array_objects = JSON.parse(HTTParty.get(URI.parse(STATISTICS_URI)).body)
        visit_details = visit_hash_objects(array_objects)
        visit_details.each do |visit|
          visit_record = Visit.find_or_initialize_by(visit.except(:pageviews_attributes))
          visit_record.assign_attributes(pageviews_attributes: visit[:pageviews_attributes])
          visit_record.save if visit_record.valid?
        end
      # Setting rescue to default Standard Error
      rescue => exception
        Rails.logger.warn "Unable to save the visit with reason: #{exception.message}, #{exception.backtrace.first(20)}"
      end
  	end

  	def visit_hash_objects(visit_details)
  	  visit_details.map do |visit_obj|
  	  	{}.tap do |options|
  	  	  options[:evid] = visit_obj['referrerName']
  	  	  options[:vendor_site_id] = visit_obj['idSite']
  	  	  options[:vendor_visit_id] = visit_obj['idVisit']
  	  	  options[:visit_ip] = visit_obj['visitIp']
  	  	  options[:vendor_visitor_id] = visit_obj['visitorId']
  	  	  options[:pageviews_attributes] = pageviews_hash_objects(visit_obj['actionDetails'])
  	    end
  	  end
  	end

  	def pageviews_hash_objects(pageview_details)
  	  pageview_details.map.with_index do |pageview, i|
  	  	{
  	  		url: pageview['url'],
  	  		time_spent: pageview['timeSpent'],
  	  		timestamp: pageview['timestamp'],
  	  		title: pageview['pageTitle'],
  	  		position: i + 1
  	  	}
  	  end
  	end
  end
end
