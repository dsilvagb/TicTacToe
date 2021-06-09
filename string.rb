# Extend String class to change color of text
class String
  def red
    "\e[31m#{self}\e[0m"
  end
end
