module Dictionary
  def create_dictionary
    return trim_dictionary(read_from_file)
  end

  protected

  def trim_dictionary(arr)
    temp_arr = arr.select{|word| word.length >= 5}
    final_arr = temp_arr.select{|word| word.length <= 12}
    
    return final_arr
  end

  def read_from_file
    dictionary_arr = File.read(File.expand_path("google-10000-english-no-swears.txt", File.dirname(__FILE__))).split(' ')

    return dictionary_arr
  end
end