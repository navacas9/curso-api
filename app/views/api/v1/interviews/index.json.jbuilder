json .array! @interviews do |interview| #Crear un array
    json.(interview, :id, :title, :description, :user_id, :expires_at)#datos 
end