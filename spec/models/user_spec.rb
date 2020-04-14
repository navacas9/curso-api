require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should_not allow_value("ricardo@gmail").for(:email)}
  it { should allow_value("ricardo@gmail.com").for(:email)}

  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:provider) }

  it "Debería crear a un usuario si el uid y el provider no existen" do
    expect{
      User.from_omniauth({uid: "1234", provider: "facebook", info: {email: "nava@gmail.com"} })
    }.to change(User,:count).by(1)
  end

  it "Debería encontrar a un usuario si el uid y el provider existen" do
    user = FactoryGirl.create(:user)
    expect{ # Cuando se encierra entre llaves se espera la ejecución del metodo
      User.from_omniauth({uid: user.uid, provider: user.provider })
    }.to change(User,:count).by(0) #Para que no agregue otro usuario a la base de datos
  end

  it "Debería retornar el usuario encontado si el uid y el provider existen" do
    #El metodo from_omniauth nos retorna al usuario
    user = FactoryGirl.create(:user)
    expect( #Cuando se encierra entre parentesis se espera lo que el metodo retorne
      User.from_omniauth({uid: user.uid, provider: user.provider })
    ).to eq(user) 
  end
end
