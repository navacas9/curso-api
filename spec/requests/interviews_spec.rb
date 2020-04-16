require 'rails_helper'

RSpec.describe Api::V1::InterviewsController, type: :request do
    #       PETICIONES
    describe "GET /interviews" do
        before :each do
            FactoryGirl.create_list(:interview, 10)
            #Antes de cada ejecución de la prueba se realiza la petición
            get "/api/v1/interviews"
        end
        it { have_http_status(200) }
        it "Mande la lista de entrevistas" do
            json = JSON.parse(response.body)
            #puts "\n\n -- #{json} --\n\n" #Para mostrar la información en el test
            expect(json.length).to eq(Interview.count) 
            #El arreglo del json debe tener la misma longitud que de la tabla de las entrevistas
        end
    end
    #   Test opción Show
    #   Nos va a devolver solo un id, por el .find en el controller
    describe "GET /interviews/:id" do
        before :each do
            @interview = FactoryGirl.create(:interview)
            get "/api/v1/interviews/#{@interview.id}"
        end

        it { have_http_status(200) }
        it "Manda la entrevista solicitada " do
         #Poner x antes del it, pone en pendiente la prueba 
            json = JSON.parse(response.body)
            puts "\n\n -- #{json} --\n\n" #Para mostrar la información del id y sus atributos
            expect(json["id"]).to eq(@interview.id)
        end

        #Ahora se valida que la vista del show nos manda las claves adecuadas
        it "Manda los atributos de la entrevista" do
            json = JSON.parse(response.body)
            expect(json.keys).to contain_exactly("id","title","description","expires_at","user_id")
        end

    end
end
    
    

    
