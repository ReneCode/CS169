module FunWithStrings
  def palindrome?
		# convert all letter to downcase
		# wipe out all not-letters
		org = self.downcase.gsub(/\W/, '')
    s = org.reverse
    s == org
  end

  def count_words
		hash = {}
		# replace non words with blank, so only words
		# are in the string.
    self.downcase.gsub(/\W/, ' ').split.each do |word |
			if (hash[word] == nil)
				hash[word] = 1
			else
				# found one more times
				hash[word] = hash[word] + 1
			end
		end
	  hash
  end

  def anagram_groups
		aWord = self.downcase.gsub(/\W/, ' ').split
		hGroup = {}
		aWord.each do | word |
			# create an unquie key
			# just take the string and sort it
			aChar = []
			word.each_char { |c|aChar.push(c) }
			aChar.sort!
			key = aChar.join
			if (!hGroup.key?(key))
				hGroup[key] = [word]
			else
				hGroup[key].push(word)
			end
		end
		# collect all hash-values (array) into an array
    hGroup.collect { |k,v| v }
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
