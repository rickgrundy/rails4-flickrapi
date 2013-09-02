unless Rails.env.test?
  %w{FLICKR_API_KEY FLICKR_API_SECRET}.each { |var| raise("#{var} is required") unless ENV.include?(var) }
end

Flickr.configure(ENV['FLICKR_API_KEY'], ENV['FLICKR_API_SECRET'])