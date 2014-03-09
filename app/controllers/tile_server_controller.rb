class TileServerController < ApplicationController

  def tile

    tile = MapTile.where(:zoom_level => params['z']).where(:tile_column => params['x']).where(:tile_row => params['y'])

    if tile.blank?
      logger.error "Failed to serve map tile z=#{params[:z]}, y=#{params[:y]}, x=#{params[:x]}"
      render :text => "Tile not found", :status => 404
    else
      tile = tile.first
      render :text => tile.tile_data, :content_type => 'image/png' and return
    end

  end

end
