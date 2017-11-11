class User < ApplicationRecord
  has_many :papers

  #Gravatar
  include Gravtastic
  gravtastic
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validações: as constraints definidas na migration do Devise tem suas mensagens configuradas no arquido de localização
  # Ver: config/locales/pt.yml
  validates :name, presence: { message: "O campo Nome completo é obrigatório" }
  validates :alias, presence: { message: "O campo Nome de usuário (Apelido) é obrigatório" }
  validates :alias, uniqueness: { message: "Esse apelido já foi cadastrado. Por gentileza, escolha outro" }
  validates :email, presence: { message: "O campo E-mail é obrigatório" }
  validates :email, uniqueness: {message: "Esse e-mail ja foi cadastrado. Recupere sua senha clicando <a href='#'>aqui<a/>".html_safe }
  #validates :password, presence: { message: "O campo Senha é obrigatório" }
  #validates :password_confirmation, presence: { message: "O campo de confirmação de senha é obrigatório" }

  def admin?
  	self.is_admin
  end

  def active?
  	self.is_active
  end
end
