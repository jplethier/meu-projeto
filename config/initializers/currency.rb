module Currency
  BRL = {:delimiter => ".", :separator => ",", :unit => "R$", :precision => 2, :position => "before"}
  USD = {:delimiter => ',', :separator => ".", :unit => "US$", :precision => 2, :position => "before"}
  DEFAULT = BRL.merge(:unit => "")
 
  module String
    def to_number(options={})
      return self.gsub(/[^\d]/,'').to_i
    end
 
  end
 
  module Number
    def to_currency(options = {})
      number = self
      default   = Currency::DEFAULT.stringify_keys
      options   = default.merge(options.stringify_keys)
      
      precision = options["precision"]
      unit      = options["unit"]
      position  = options["position"]
      separator = precision > 0 ? options["separator"] : ""
      delimiter = options["delimiter"]
 
      begin
        parts = (number/100.0).with_precision(precision).split('.')
        number = parts[0].to_i.with_delimiter(delimiter) + separator + parts[1].to_s
        position == "before" ? unit.to_s + number : number + unit.to_s
      rescue
        number
      end
    end
 
    def with_delimiter(delimiter=",", separator=".")
      number = self
      begin
        parts = number.to_s.split(separator)
        parts[0].gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{delimiter}")
        parts.join separator
      rescue
        self
      end
    end
 
    def with_precision(precision=3)
      number = self
      "%01.#{precision}f" % number
    end
  end
end
 
class Numeric; include Currency::Number; end
class String; include Currency::String; end
