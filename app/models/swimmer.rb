class Swimmer < ActiveRecord::Base
  before_save :set_category
  
  belongs_to :event
  
  validates_presence_of :name, :secname, :gen, :email, :phone, :dni, :club, :fed, :year, :pob, :postal, :prov, :dir, :prueba,
                        :message => "no puede estar en blanco"
  
  validates_uniqueness_of :dni, :message => "Ya existe otro nadador con ese DNI"
  validates :dni, :length => { :is => 8, :message => "tiene que tener 8 digitos numericos" }, :numericality => true 
  
  validates_uniqueness_of :name, :scope => :secname, :message => "nombre y apellidos ya insertados por un inscrito"
  validates_numericality_of :postal, :phone, :message => "de tipo numerico"
  validates_format_of     :email,
                          :with       => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                          :message    => 'debe tener formato valido. Ej: email@direccion.com'
  
  
  private
  
  def set_category
    if self.prueba==1500
      case self.year
      when 1987..1995 then self.cat = "AB"
      when 1982..1986 then self.cat = "MA"
      when 1977..1981 then self.cat = "MB"
      when 1972..1976 then self.cat = "MC"
      when 1967..1971 then self.cat = "MD"
      when 1962..1966 then self.cat = "ME"
      when 1957..1961 then self.cat = "MF"
      when 1952..1956 then self.cat = "MG"
      when 1947..1951 then self.cat = "MH"
      when 1942..1946 then self.cat = "MI"
      when 1937..1941 then self.cat = "MJ"
      when 1932..1936 then self.cat = "MK"
      when 1927..1931 then self.cat = "ML"
      when 1922..1926 then self.cat = "MM"
      when 1900..1921 then self.cat = "ML"
      end
    else
      if self.prueba==3000
        case self.year
        when 1982..1995 then self.cat = "AB"
        when 1972..1981 then self.cat = "M30"
        when 1962..1971 then self.cat = "M40"
        when 1900..1961 then self.cat = "M50"
        end
      end
    end       
  end
  
end
