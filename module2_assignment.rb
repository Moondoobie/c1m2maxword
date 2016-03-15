class LineAnalyzer
  attr_reader :highest_wf_count, # a number with maximum number of occurrences for a single word (calculated)
              :highest_wf_words, # an array of words with the maximum number of occurrences (calculated)
              :highest_wf_kvpairs,
              :content, # the string analyzed (provided)
              :line_number # the line number analyzed (provided)

  def initialize (content, line_number)
    #* take in a line of text and line number
    #* initialize the content and line_number attributes
    
    @content = content
    @line_number = line_number
    

    #* call the calculate_word_frequency() method.
    calculate_word_frequency(self.content)
  end


  def calculate_word_frequency (line)
      #* calculate the maximum number of times a single word appears within
      #  provided content and store that in the highest_wf_count attribute.

      #* identify the words that were used the maximum number of times and
      #  store that in the highest_wf_words attribute.
      
      # line = "The store the bore and the floor my oh more."
      word_frequency = Hash.new(0)
      highest_wf_count = 0
      highest_wf_kvpairs = []
      highest_wf_words = []

      line.split.each do |word| 
        word_frequency[word.downcase] += 1 
      end 

      p word_frequency # => {"chicka" => 2, "boom" => 2}
      @highest_wf_count = word_frequency.values.max
      @highest_wf_kvpairs = word_frequency.select {|k, v| v == self.highest_wf_count}
      @highest_wf_words = self.highest_wf_kvpairs.keys
  end
end


class Solution

  # Implement the following read-only attributes in the Solution class.
  attr_reader :analyzers, # an array of LineAnalyzer objects for each line in the file
              :highest_count_across_lines, # a number with the maximum value for highest_wf_words attribute in the analyzers array.
              :highest_count_words_across_lines # a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
                                                #  equal to the highest_count_across_lines determined previously.
  
  # Implement the following methods in the Solution class.
  #* initialize() - initialize analyzers as an empty array.
  def initialize
    @analyzers = []
  end


  #* analyze_file() - processes 'test.txt' into an array of LineAnalyzers and stores them in analyzers.
  def analyze_file
    #* Read the 'test.txt' file in lines 
    if File.exist? 'test.txt'
      
      File.foreach( 'test.txt' ) do |line|
        p line.chomp
        line_number = 0 if line_number == nil
        line_number = line_number + 1
        
        #* Create an array of LineAnalyzers for each line in the file
        
        lineAnalyzer = LineAnalyzer.new(line, line_number)
        @analyzers << lineAnalyzer
          
      end

    end

  end


  def calculate_line_with_highest_frequency
    # hash.key(value) => key
    #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and
    #  highest_count_words_across_lines attribute values 
    #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
    #  and stores this result in the highest_count_across_lines attribute.
    @highest_count_across_lines = 0
    @highest_count_words_across_lines = []
    @analyzers.each do |lineAnalyzer|
      puts "*"
      puts lineAnalyzer.highest_wf_count
      puts "**"
      puts highest_count_across_lines
      puts "***"
      #puts highest_count_words_across_lines
      puts "****"
      if (highest_count_across_lines < lineAnalyzer.highest_wf_count)
        @highest_count_across_lines = lineAnalyzer.highest_wf_count
        #@highest_count_words_across_lines << lineAnalyzer.highest_wf_count.key
      end
    end
    puts "## #### ##"
    puts "## #### ##"
    puts highest_count_across_lines
    #puts highest_count_words_across_lines
    puts "## #### ##"
    puts "## #### ##"
    #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
    #  attribute value determined previously and stores them in highest_count_words_across_lines.
  end
  

  def print_highest_word_frequency_across_lines
    #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in
    #  highest_count_words_across_lines in the specified format
    #* print the values of objects in highest_count_words_across_lines in the specified format
    # "#{one} multiplied by #{two} equals #{one * two}" 
  end

end