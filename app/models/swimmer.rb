class Swimmer < ActiveRecord::Base
  before_save :set_category
  
  belongs_to :event
  
  validates_presence_of :name, :secname, :gen, :email, :phone, :dni, :club, :fed, :year, :pob, :postal, :prov, :dir, :size,
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
    if (self.year >= 1987) and (self.year <= 2004)
      if self.gen == "Masculino"
        case self.year
        when 2003..2004 then self.cat = "MINI"
        when 2002 then self.cat = "PRE"
        when 2000..2001 then self.cat = "BENJ"
        when 1998..1999 then self.cat = "ALE"
        when 1995..1997 then self.cat = "INF"
        when 1993..1994 then self.cat = "JUN"
        when 1987..1992 then self.cat = "ABS"
        end
      else
        case self.year
        when 2004 then self.cat = "MINI"
        when 2003 then self.cat = "PRE"
        when 2001..2002 then self.cat = "BENJ"
        when 1999..2000 then self.cat = "ALE"
        when 1997..1998 then self.cat = "INF"
        when 1995..1996 then self.cat = "JUN"
        when 1987..1994 then self.cat = "ABS"
        end
      end
    else
      case self.year
      when 1982..1986 then self.cat = "MA"
      when 1977..1982 then self.cat = "MB"
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
      when 1900..1921 then self.cat = "MN"
      end
    end
         
      
  end
  
end
