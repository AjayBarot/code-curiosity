class Activity
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description,   type: String
  field :event_type,    type: String
  field :repo,          type: String
  field :ref_url,       type: String
  field :commented_on,  type: Time

  belongs_to :member
  belongs_to :team
  belongs_to :round

  has_many :scores, as: :scorable, dependent: :destroy
  
  validates :description, uniqueness: {:scope => :commented_on}
  
  scope :for_round, -> (round_id) { where(:round_id => round_id) }
end