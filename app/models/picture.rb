class Picture < ActiveRecord::Base

  belongs_to :imageable, polymorphic: true

  has_attached_file :image, styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>" }

  validates_attachment :image, presence: true, content_type: { content_type: /\Aimage/ },
  size: { in: 0..10.megabytes }

  def set_default_position
    if self.post
      self.position ||= self.post.attachments.maximum(:position).to_i + 1
    end
    true
  end
  # def title
  #   comment.present? ? comment : image_file_name
  # end
end
