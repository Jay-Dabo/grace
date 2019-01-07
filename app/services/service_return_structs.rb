Error = Struct.new(:error_message, :data) {
  def success?
    false
  end

  def error?
    true
  end
}

Success = Struct.new(:success_message, :data) {
  def success?
    true
  end

  def error?
    false
  end
}