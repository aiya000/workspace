class String
  MAP = {
    "A" => "4",
    "E" => "3",
    "G" => "6",
    "I" => "1",
    "O" => "0",
    "S" => "5",
    "Z" => "2"
  }

  def replace_to_leef
    self.split("").map{|c| _c = MAP[c]; if _c == nil then c else _c end }.join
  end
end


puts gets.replace_to_leef
