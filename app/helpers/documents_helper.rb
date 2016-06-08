module DocumentsHelper

  def show_attachment(attachment)
    "#{attachment.doc_file_name} (#{number_to_human_size(attachment.doc_file_size)})"
  end

  def link_to_attachment(attachment)
    link_to(attachment.doc.url, title: "Документ", data: {toggle: 'popover', content: "#{number_to_human_size(attachment.doc_file_size)}", html: true, trigger: 'hover'}) do
      concat content_tag(:span, nil, class: 'glyphicon glyphicon-paperclip')
      concat show_attachment(attachment)
    end
  end
end
