DogecoinClient.configure do |config|
    config.host = 'localhost'
    config.port = 22555
    config.protocol = :http
    config.user = 'dogecoinrpc'
    config.password = ENV['DOGECOIN_RPC_PASSWORD']
end
