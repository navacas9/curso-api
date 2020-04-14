class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

    before_action :authenticate  #Callback
    #Saber que usuario está logueado en toda nuestra aplicación

    def authenticate #toda la lógica
        token_str = params[:token] #token cadena
        token = Token.find_by(token: token_str) #Buscar el token
        #find_by encontrar un solo elemento

        if token.nil? || !token.is_valid?  #Validar el token encontrado
            #si es nulo o si no es valido
            return json: {error: "Tu token es invalido", status: unauthorized}
        else
            @current_user = token.user
        end
    end

end
