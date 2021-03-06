class Stage < ApplicationRecord
  extend FriendlyId
  acts_as_paranoid

  belongs_to :owner, :class_name => 'User'
  has_many :stage_media, :dependent => :destroy
  has_many :media, :through => :stage_media
  has_many :avatar_stages
  has_many :avatars, :through => :avatar_stages
  has_many :messages, dependent: :destroy


  friendly_id :name, :use => [ :slugged, :finders ]

  validates :name, :presence => true
  validates :owner, :presence => true
end
