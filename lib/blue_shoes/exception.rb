class StandardError < Exception; end

module Shoes
  class ImageError < StandardError; end

  class InvalidModeError < StandardError; end

  class NotImplementedError < StandardError; end

  class SettingUp < StandardError; end

  class VideoError < StandardError; end
end
  
