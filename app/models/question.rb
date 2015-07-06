class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :question_comments
  validates_presence_of :heading
  validates_presence_of :content

end
