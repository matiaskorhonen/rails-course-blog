class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  
  validates_presence_of :title, :body
  validates_length_of :body,
                      :minimum => 10,
                      :message => "isn't long enough!"
  validates_length_of :title,
                      :within => 5..50
                      
  def Post.all_published
    find_all_by_published(true).reverse
  end
end
