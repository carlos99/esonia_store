class Product < ActiveRecord::Base
  belongs_to :user
  has_many :sales

#Stripe does not allow charges less than $0.50
  validates_numericality_of :price, greater_than: 49,
  message: "Must be at lest $0.50 cents"

  has_attached_file :file

  validates_attachment_content_type :file, :content_type => [
  	"image/jpg",
	"image/jpeg",
	"image/png",
	"image/gif",
	"application/pdf",
	"application/zip"
  ]
end
