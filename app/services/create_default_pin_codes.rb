module CreateDefaultPinCodes
  module_function

  def pre_import_defaults
    create_unknowns
  end

  def post_import_defaults
    create_delhi_defaults
  end

  ## ---------------------------------------
  ## Private
  ## ---------------------------------------

  def create_unknowns
    circle = Circle.find_or_create_by!( { coordinator: '', name: 'Unknown'} )
    s = Sector.find_or_create_by!( { coordinator: '', name: 'Unknown', circle_id: circle.id} )
    c = Center.find_or_create_by!( { coordinator: '', name: 'Unknown', sector_id: s.id} )
    PinCode.find_or_create_by!( { string: '', state: '', center_id: c.id} )
  end

  def create_delhi_defaults
    circle = Circle.find_by name: 'Delhi'
    s = Sector.find_or_create_by!( { coordinator: '', name: 'Delhi Unknown', circle_id: circle.id} )
    c = Center.find_or_create_by!( { coordinator: '', name: 'Delhi Unknown', sector_id: s.id} )
    PinCode.find_or_create_by!( { string: 'Delhi Unknown', state: '', center_id: c.id} )
  end
end
