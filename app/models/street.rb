class Street
  include Mongoid::Document
  field :name, type: String
  
  
  embeds_many :restrictions
  
  
  def create_or_update_restriction(params)
    restriction = self.restrictions.find_or_create_by(street_id: self.id, arcgis_id: params[:arcgis_id])
    restriction.update_attributes(params)
    restriction.street_id = self.id
    restriction.save
  end
end
