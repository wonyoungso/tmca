# -*- encoding : utf-8 -*-
module Media
  class Media::Group
    attr_accessor :title, :description, :category, :keywords
    def initialize(title)
      @title = Media::Title.new(title)
    end
  end

  class Media::Title
    attr_accessor :type
  end

  class Media::Description
    attr_accessor :type
  end

  class Media::Category
    attr_accessor :scheme
  end

  class Media::Keywords
    attr_accessor :type
  end
end
