class JsonFilter
  def initialize(app)
    @app = app
  end

  def call(env)
    @env = env
    @request = Rack::Request.new(env)
    status, headers, body = @app.call(env)

    @response = Rack::Response.new(body, status, headers)
    # binding.pry
    apply_response_filters if filter_fields?

    @response.finish
  end

  def filter_fields?
    @request.params["fields"] && !@request.params["fields"].empty?
  end

  def filter_fields
    @request.params["fields"].split(",")
  end

  def apply_response_filters
    @response.body = [filtered_parsed_response.to_json]
  end

  def filtered_parsed_response
    if parsed_response.class == Hash
      parsed_response.select { |k,y| filter_fields.include?(k)}
    else
      parsed_response.map do |hash|
        hash.select { |k,y| filter_fields.include?(k)}
      end
    end
  end

  def parsed_response
    JSON.parse(@response.body.first)
  end
end
