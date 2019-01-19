class Spinner
  SECTIONS = [
    :one,
    :two,
    :three,
    :four,
    :dog,
    :bird,
    :spilled_basket
  ]
  
  def self.spin
    SECTIONS.sample
  end
end