module CreateUnknownPinCodes
  def self.call
    Circle.create([ { coordinator: '', name: 'Unknown'}, ])
    Sector.create([ { coordinator: '', name: 'Unknown', circle_id: Circle.find_by(name: 'Unknown').id}, ])
    Center.create([ { coordinator: '', name: 'Unknown', sector_id: Sector.find_by(name: 'Unknown').id}, ])
    PinCode.create([ { string: '', state: '', center_id: Center.find_by(name: 'Unknown').id}, ])
  end
end
