class User < ApplicationRecord
    validates :email, presence: true, email: true
    validates :uid, presence: true
    validates :provider, presence: true
    has_many :tokens

    #Los metodos de clase en ruby se anteponen con self.
    def self.from_omniauth(data)# recibe un hash de datos
        User.where(provider: data[:provider], uid: data[:uid]).first_or_create do |user|
            user.email = data[:info][:email]
        end
       
    end
end
