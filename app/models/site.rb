require 'net/http'

class Site < ActiveRecord::Base

  has_many :probes

  def self.dispatch_probes
    Site.all.each do |site|

      uri = URI site.endpoint
      Net::HTTP.start(uri.host) do |http|
        http.open_timeout = 2
        http.read_timeout = 2
        req = Net::HTTP::Head.new(uri.path)
        t = Time.now
        response = http.request(req)
        t = Time.now - t
        is_event = (response.code != Site.probes.last.status)
        Probe.create!(site_id: site.id, status: response.code, response_time: t, is_event: is_event)
      end

    end
  end

end
