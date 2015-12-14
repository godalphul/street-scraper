class Restriction
  include Mongoid::Document
  field :street_id, type: String
  field :arcgis_id, type: String
  field :dynamap_id, type: String
  field :l_f_add, type: String
  field :l_t_add, type: String
  field :r_f_add, type: String
  field :r_t_add, type: String
  field :fcc, type: String
  field :postal_l, type: String
  field :postal_r, type: String
  field :acc, type: String
  field :seg_len, type: String
  field :tf_dir, type: String
  field :name_flag, type: String
  field :notes, type: String
  field :route, type: String
  field :day_odd, type: String
  field :time_odd, type: String
  field :day_even, type: String
  field :time_even, type: String
  field :mapno, type: String
  field :doubleck, type: String
  field :sideofstreet, type: String
  field :speed, type: String
  field :one_way, type: String
  field :f_zlev, type: String
  field :t_zlev, type: String
  field :ft_cost, type: String
  field :tf_cost, type: String
  field :ft_dir, type: String
  field :street_name, type: String
  field :street_type, type: String
  field :street_prefix, type: String
  field :street_suffix, type: String  
  
  embedded_in :street
end
