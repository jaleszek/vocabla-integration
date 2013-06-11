module Helper
  def getEmail
    random_number=(1..9999).to_a.shuffle
    random_number=random_number.pop
    return "user"+random_number.to_s+"@gmail.com"
  end
end