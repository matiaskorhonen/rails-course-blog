class Post < ActiveRecord::Base
  has_many :comments
  
  validates_presence_of :title, :body
  validates_length_of :body,
                      :minimum => 10,
                      :message => "isn't long enough!"
  validates_length_of :title,
                      :within => 5..50
end