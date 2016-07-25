class JsonFilter
  def initialize(app)
    @app = app
  end

  def call(env)
    store_parser if env["PATH_INFO"] == "/store"
    [200, {"Content-Type" => "text/html"}, ["Hello, World!"]]
  end

  def store_parser
    
  end
end

# "PATH_INFO"=>"/stores/1",
# "QUERY_STRING"=>"fields=store_id,name",