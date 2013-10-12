
def hello(a)
  "Hello, " + a
end


def starts_with_consonant?(s)
  if s.length == 0
  	return false
  end 
  c = s[0..0]
  if (c =~ /\w/) == nil
  	return false
  end
  return (c =~ /^[AEIOU].*/i ) == nil
end


def binary_multiple_of_4?(str)
  return (str =~ /^[01]*1[01]*00$/) != nil
end

def b2inary_multiple_of_4?(str)
  if str.length == 0
  	return false
  end
  n0 = str.count "0"
  n1 = str.count "1"
  if n0 + n1 != str.length
  	return false;
  end
  val = str.to_i(2)
  return val  % 4 == 0
end
