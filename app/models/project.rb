class Project < ActiveRecord::Base
  attr_accessible :title, :seeking_amount, :funded_amount, :description, :image, :video_url, :status, :objectives_attributes, :tags_attributes

  # CARRIERWAVE IMAGE UPLOADER
  mount_uploader :image, ImageUploader

  # RELATIONSHIPS
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :objectives, dependent: :destroy
  has_many :tags, dependent: :destroy

  accepts_nested_attributes_for :objectives, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :tags, allow_destroy: true, reject_if: :all_blank

  # VALIDATIONS
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true

  def self.filter(search='')
    wheres = []
    values = []

    search.to_s.split(' ').each do |v|
      %w[title description].each do |a|
        wheres << "#{a} LIKE ?"
        values << "#{v}%"
        wheres << "#{a} LIKE ?"
        values << "% #{v}%"
      end
    end

    if wheres.empty?
      where(primary_key => 0)
    else
      where [wheres.join(' OR '), *values]
    end
  end
end
