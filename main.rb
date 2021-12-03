require 'sinatra'

#The Secret Key for your App ID
secret_key = 'rne78XrKJQARgU0vpMKL'

get '/deposit' do
    #Get the parameter `id`
    id = params[:id]
    #Get `currency` parameter
    currency = params[:currency]
    #Get `snuid` which should equal what was set by the SDK's `setUserId`
    snuid = params[:snuid]
    #Get Tapjoy's generated verifier
    verifier = params[:verifier]
    #Compute a new verifier with our Secret Key and parameters
    computed_verifier = Digest::MD5.hexdigest("#{id}:#{snuid}:#{currency}:#{secret_key}")

    #Does the supplied verifier and our computed one match?
    if verifier.eql? computed_verifier
        #Valid, save currency
        #Return 200
        status 200
		puts '200'
    else
        #Somethings not right
        #Return 403
        status 403
		puts '403'
    end
end