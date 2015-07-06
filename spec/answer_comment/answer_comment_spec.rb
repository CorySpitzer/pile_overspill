require 'rails_helper'

describe AnswerComment do

  it { should validate_presence_of :content }
  it { should belong_to :answer }
  it { should belong_to :user }


end
