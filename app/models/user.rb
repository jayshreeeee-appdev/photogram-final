# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  comments_count  :integer
#  email           :string
#  likes_count     :integer
#  password_digest :string
#  private         :boolean
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:comments, {
    :class_name => "Comment",
    :foreign_key => "author_id"
  })
  
  has_many(:received_follow_requests, {
    :class_name => "Followrequest",
    :foreign_key => "recipient_id"
  })

  has_many(:request_sender, {
    :class_name => "Followrequest",
    :foreign_key => "sender_id"
  })

  has_many(:liker, {
    :class_name => "Like",
    :foreign_key => "fan_id"
  })


 

end
