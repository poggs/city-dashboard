class MapTile < ActiveRecord::Base

  establish_connection 'mapdb'
  self.table_name = 'tiles'

end