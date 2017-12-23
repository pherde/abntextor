class User < ApplicationRecord
  has_many :papers, dependent: :destroy

  #Gravatar
  include Gravtastic
  gravtastic
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: { message: "O campo Nome completo é obrigatório" }
  validates :alias, presence: { message: "O campo Nome de usuário (Apelido) é obrigatório" }
  validates :alias, uniqueness: { message: "Esse apelido já foi cadastrado. Por gentileza, escolha outro" }
  validates :email, presence: { message: "O campo E-mail é obrigatório" }
  validates :email, uniqueness: {message: "Esse e-mail ja foi cadastrado. Recupere sua senha clicando <a href='#'>aqui<a/>".html_safe }

  def admin?
  	self.is_admin
  end

  def active?
  	self.is_active
  end
end
