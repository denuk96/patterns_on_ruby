# Facade

class Magic
   def self.get_water
     Water.cast_water
   end 

   def self.get_fire
     Fire.cast_fire
   end 

   def self.get_wind
     Wind.cast_wind
   end 
end    
  
# hidden logic

class Water
  def self.cast_water
    'casting water...'
  end
end 

class Fire
  def self.cast_fire
    'casting fire...'
  end
end 

class Wind
  def self.cast_wind
    'casting wind...'
  end
end  

wind = Magic.get_wind
# => "casting wind..."

    
