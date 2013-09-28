class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessor :current_password

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me,
                  :headline, :image, :location, :linkedin, :facebook, :twitter, :bio, :current_password,
                  :investor_status, :investor_type, :remote_image_url

  #RELATIONSHIPS
  has_many :projects, dependent: :destroy
  has_many :organizations, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  # UPLOADER FOR USER PIC
  mount_uploader :image, ImageUploader

  filter_by :first_name, :last_name, :headline, :bio

  # CREATE A METHOD TO PRINT OUT FULL NAME OF USER
  def full_name
    "#{first_name} #{last_name}"
  end

  # BUILD A NEW USER FROM LINKEDIN OAUTH
  def self.from_omniauth(auth)
    user = where(auth.slice(:provider, :uid)).first_or_initialize
    user.provider         = auth.provider
    user.uid              = auth.uid
    if user.new_record?
      # only set these on the first login
      user.first_name       = auth.info.first_name
      user.last_name        = auth.info.last_name
      user.email            = auth.info.email
      user.headline         = auth.info.headline
      user.location         = auth.info.location
      user.linkedin         = auth.info.urls.public_profile
      user.remote_image_url = auth.info.image if auth.info.image
    else
      user.save
    end
    user
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  # FOLLOWING / FOLLOWER LOGIC
  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  # ACCREDITED INVESTOR STATUS
  def approved_investor?
    investor_status == true
  end

end
