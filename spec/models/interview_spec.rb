require 'rails_helper'

RSpec.describe Interview, type: :model do
  #     VALIDACIONES PARAA LA ENTREVISTA
  it { should validate_presence_of :title }
  it { should_not allow_value("a").for(:title) }
  it { should validate_length_of(:title).is_at_least(10) } #Que tenga 10 caracteres como minimo el titulo
  it { should belong_to(:user) }
  it { should validate_presence_of :description }
  it { should validate_length_of(:description).is_at_least(20) }
  it { should validate_presence_of :expires_at }

  # Se crean las pruebas de los factories
  
    it "should return valid when is not expired" do
      interview = FactoryGirl.create(:interview, expires_at: DateTime.now + 1.minute)
      expect(interview.is_valid?).to eq(true)
    end
  
    it "should return invalid when is expired" do
      interview = FactoryGirl.create(:interview, expires_at: DateTime.now - 1.day)
      expect(interview.is_valid?).to eq(false)
    end
end
