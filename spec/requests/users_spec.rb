require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
    describe "POST /users" do

        before :each do #Para no repetir codigo utilizamos esto
            auth = { auth: { provider: "facebook", uid: "323232", info: { email: "navass@gmail.com" } } }
            post "/api/v1/users", {params: auth}
        end

        it {have_http_status(200)}

        it {change(User,:count).by(1)}
        
        it "Responds with the user found or created" do
            json=JSON.parse(response.body)
            expect(json["email"]).to eq("navass@gmail.com")
        end

=begin        
        it  "Responds with a 200 code" do
            #post "/api/v1/users"
            have_http_status(200)
        end

        it "creates a new user with new data" do
            #auth = { auth: { provider: "facebook", uid: "323232", info: { email: "navass@gmail.com" } } }

            expect{
               # post "/api/v1/users", {params: auth}
            }.to change(User,:count).by(1)
        end

        it "responds with the user found or created" do
            # auth = { auth: { provider: "facebook", uid: "323232", info: { email: "navass@gmail.com" } } } 
           # post "/api/v1/users", {params: auth}
            json = JSON.parse(response.body)
            #puts "\n\n\n --- #{json} --- \n\n\n"  #Imprimir el JSON con los datos
            expect(json["email"]).to eq("navass@gmail.com")
        end
=end
    end
end
