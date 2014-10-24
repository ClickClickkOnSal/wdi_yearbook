class Student
  include Mongoid::Document
  field :name, type: String
  field :superlative, type:String
  field :image_url, type: String
end
