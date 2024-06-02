class ErrorSerializer
  def initialize(error_object)
    @error_object = error_object
  end

  def serialize_json
    {
      errors: [
        {
          detail: @error_object.message.first
        }
      ]
    }
  end

  def serialize_message
    {
      errors: [
        {
          detail: @error_object.message
        }
      ]
    }
  end
end