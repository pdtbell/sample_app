class User
  attr_accessor :name, :email
  
  def initialize(attriutes = {})
    @name = attributes[:name]
    @email = attributes[:email]
  end
  
  def formatted_email
    "#{@name} <#{@email}>"
  end
end
