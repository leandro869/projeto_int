class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :trackable
  include DeviseTokenAuth::Concerns::User

  def calculate_result
    value = 0
    question_users.each do |question_user|
      puts "Resposta: #{question_user.answer}" # Debugging
      case question_user.answer
      when 'option_1'
        value += 1
      when 'option_2'
        value += 2
      when 'option_3'
        value += 3
      else
        value += 5
      end
    end
    value
  end
  
end