
class CalcularDistancia
    def self.calcular_distancia(lat1, lon1, lat2, lon2) #haversine
        r = 6371.0 # raio da Terra em quilômetros
        p = Math::PI / 180.0
      
        a = 0.5 - Math.cos((lat2 - lat1) * p) / 2 + Math.cos(lat1 * p) * Math.cos(lat2 * p) * (1 - Math.cos((lon2 - lon1) * p)) / 2
        return 2 * r * Math.asin(Math.sqrt(a))
      end
end