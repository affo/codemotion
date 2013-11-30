class Robot
  attr_reader :element

  def initialize element
    @element = element
  end

  def on event, &callback
    if event == :speak
      @speak = callback
    else
      raise ArgumentError, 'unknown event'
    end
  end

  def update
    @code = element.at_css('textarea').value
  end
end
