module Gravatar
  class MainController < Volt::ModelController
    def default_image
      attrs.default ? attrs.default.to_s : 'mm'
    end

    def image_size
      attrs.size ? attrs.size.to_i : 80
    end

    def rating
      attrs.rating ? attrs.rating : 'pg'
    end

    def gravatar_image_src
      Volt.fetch_current_user.then do |user|
        email_address = user.email.downcase
        hash = `md5(email_address)`
        "//www.gravatar.com/avatar/#{hash}.jpg?s=#{image_size.to_s}&d=#{default_image}&r=#{rating}"
      end.fail do
        "//www.gravatar.com/avatar/00000000000000000000000000000000.jpg?s=#{size.to_s}&d=#{default_image}&r=#{rating}"
      end

    end

    private

    # the main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._controller and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end
  end
end
