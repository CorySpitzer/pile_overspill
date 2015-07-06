class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :answer_comments
  validates_presence_of :content

end
