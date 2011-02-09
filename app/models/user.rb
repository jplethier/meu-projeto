class User < ActiveRecord::Base

    attr_accessor :senha
    attr_accessible :nome, :email, :senha, :senha_confirmation

    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :nome,  :presence => true
    validates :email, :presence => true,
                      :format => {:with => email_regex },
                      :uniqueness => true
    validates :senha, :presence => true,
                      :confirmation => true,
                      :length => { :within => 4..8 }

end
