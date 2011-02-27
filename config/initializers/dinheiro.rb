class Dinheiro

    attr_accessor :valor

    def initialize(valor)
        @valor = valor
    end

    def to_s
        if @valor.nil? 
            "" 
        else
            @valor.to_currency
        end
    end
end
