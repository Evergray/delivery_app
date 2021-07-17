class Courier < ApplicationRecord
    has_many :packages, dependent: :destroy

    validates :name, presence: true, length: {minimum: 2}
    validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP, message: "address is not valid"} 
end
