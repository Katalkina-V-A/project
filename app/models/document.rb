class Document < ActiveRecord::Base
  has_attached_file :doc, styles: {thumbnail: "60x60#"}
  validates_attachment :doc, content_type: { content_type: "application/pdf" }
  belongs_to :post
end
