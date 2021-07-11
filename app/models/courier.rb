class Courier < ApplicationRecord
    validates :name, presence: true, length: {minimum: 2}
    validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP, message: "address is not valid"} 
end
