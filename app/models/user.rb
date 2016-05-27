class User < ActiveRecord::Base
  # atributos do usuário
  # - first_name
  # - last_name
  # - email
  # - birthdate
  # - gender
  # - password_digest

  # usuário não pode salvar sem algum desses atributos
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :birthdate
  validates_presence_of :gender

  # email para ficar no formato de blabla@blable.bla
  validates_format_of :email, { with: /\A[\w+\-.]+@[a-z\-]+\.[a-z]+\Z/i, message: "Formato permitido: joaodasilva@provedor.com.br" }

  # email não pode ser repetido
  validates_uniqueness_of :email

  # genero pode ser apenas masculino/feminino
  validates_inclusion_of :gender, in: %w(masculino feminino)

  # a data de nascimento não pode ser maior que a data de hoje
  validate :birthdate_less_than_today

  has_many :baths

  # a senha é salva encriptada no banco
  has_secure_password

  def birthdate_less_than_today
    birthdate <= Date.today
  end

end
