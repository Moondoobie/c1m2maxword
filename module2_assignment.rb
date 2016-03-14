#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  #Implement the following read-only attributes in the LineAnalyzer class. 
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content          - the string analyzed (provided)
  #* line_number      - the line number analyzed (provided)

  attr_reader :highest_wf_count, # a number with maximum number of occurrences for a single word (calculated)
              :highest_wf_words, # an array of words with the maximum number of occurrences (calculated)
              :content, # the string analyzed (provided)
              :line_number # the line number analyzed (provided)

              #Add the following methods in the LineAnalyzer class.
              #* initialize() - taking a line of text (content) and a line number
              #* calculate_word_frequency() - calculates result

  #Implement the initialize() method to:
  def initialize (content, line_number)
    #* take in a line of text and line number
    #* initialize the content and line_number attributes
    line = content
    line_number = 1
    

    #* call the calculate_word_frequency() method.
    calculate_word_frequency(line)
  end


  def calculate_word_frequency (line)
      #* calculate the maximum number of times a single word appears within
      #  provided content and store that in the highest_wf_count attribute.
      #* identify the words that were used the maximum number of times and
      #  store that in the highest_wf_words attribute.

      word_frequency = Hash.new(0) 
 
      line.split.each do |word| 
        word_frequency[word.downcase] += 1 
      end 

      p word_frequency # => {"chicka" => 2, "boom" => 2}
      highest_wf_count = word_frequency.values.max
      highest_wf_words << word_frequency.word(highest_wf_count)
  end
end

#  Implement a class called Solution. 
class Solution

  # Implement the following read-only attributes in the Solution class.
  attr_reader :analyzers, # an array of LineAnalyzer objects for each line in the file
              :highest_count_across_lines, # a number with the maximum value for highest_wf_words attribute in the analyzers array.
              :highest_count_words_across_lines # a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
                                                #  equal to the highest_count_across_lines determined previously.
  
  # Implement the following methods in the Solution class.
  #* initialize() - initialize analyzers as an empty array.
  def initialize
    @@analyzers = []

  end

  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
  def analyze_file
    line_number = 0
    #* Read the 'test.txt' file in lines 
    if File.exist? 'test.txt'

    File.foreach( 'test.txt' ) do |line|
      p line.chomp
      line_number ++
      LineAnalyzer.initialize(line, line_number)
      analyzers << line
    end

  end
    #* Create an array of LineAnalyzers for each line in the file
  end

  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and
  #  highest_count_words_across_lines attribute values 
  def calculate_line_with_highest_frequency
    #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
    #  and stores this result in the highest_count_across_lines attribute.
    
    #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
    #  attribute value determined previously and stores them in highest_count_words_across_lines.

  end
  
  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in
  #  highest_count_words_across_lines in the specified format
  def print_highest_word_frequency_across_lines
    #* print the values of objects in highest_count_words_across_lines in the specified format
    # "#{one} multiplied by #{two} equals #{one * two}" 
  end
  
end

# p line.split # array of words in line

# hash.key(value) => key
