class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags
  validates_presence_of :name, :content
  def tags_attributes=(tags_attributes)
    
    tags_attributes.each do | attributes, values |
      unless values == nil
        unless values["name"] == ""
          tag = Tag.find_or_create_by(values)
          self.tags << tag
        end
      end
    end

  end
end
