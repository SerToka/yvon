module ApplicationHelper
  def yield_with_default(args = {})
    if content_for?(args[:holder])
      "#{content_for(args[:holder]).squish} | #{args[:default]}"
    else
      args[:default]
    end
  end

  def cl_image_tag_with_default(photo_path, options = {})
    if photo_path
      cl_image_tag(photo_path, options)
    else
      cl_image_tag('YVON_382_200.png', options)
    end
  end

  def cl_image_path_with_default(photo_path, options = {})
    if photo_path
      cl_image_path(photo_path, options)
    else
      cl_image_path('YVON_382_200.png', options)
    end
  end

  def cl_image_path_with_second(first_photo_path, second_photo_path, options = {})
    if first_photo_path
      cl_image_path(first_photo_path, options)
    elsif second_photo_path
      cl_image_path(second_photo_path, options)
    else
      cl_image_path('YVON_382_200.png', options)
    end
  end
end
