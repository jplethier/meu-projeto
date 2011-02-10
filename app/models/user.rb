class User < ActiveRecord::Base

    attr_accessible :nome, :email, :senha, :senha_confirmation

    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :nome,  :presence => true
    validates :email, :presence => true,
                      :format => {:with => email_regex },
                      :uniqueness => true
    validates :senha, :confirmation => true,
                      :presence => true,
                      :length => { :within => 4..8 }

    before_save :encrypt_password

    private

        def encrypt_password
            self.salt = make_salt if new_record?
            self.senha = encrypt(senha)
        end

        def encrypt(string)
            secure_hash("#{salt}--#{string}")
        end

        def make_salt
            secure_hash("#{Time.now.utc}--#{senha}")
        end

        def secure_hash(string)
            Digest::SHA2.hexdigest(string)
        end

end
