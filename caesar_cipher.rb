module CaesarCipher
  ALPHABET_SIZE = 26
  MAX_UNICODE = 0x10FFFF

  def self.shift_char(char, shift, base, size)
    ((char - base + shift) % size) + base 
  end
  
  def self.cipher_ascii(string, shift)
    byte_array = string.codepoints.map do |char|
      if char.between?(65,90)
        shift_char(char, shift, 65, ALPHABET_SIZE)
      elsif char.between?(97, 122)
        shift_char(char, shift, 97, ALPHABET_SIZE)
      else
        char
      end
    end
    
    byte_array.pack("C*")
  end

  def self.decipher_ascii(string, shift)
    byte_array = string.codepoints.map do |char|
      if char.between?(65,90)
        shift_char(char, -shift, 65, ALPHABET_SIZE)
      elsif char.between?(97, 122)
        shift_char(char, -shift, 97, ALPHABET_SIZE)
      else
        char
      end
    end
    
    byte_array.pack("C*")
  end

  def self.brute_force_decipher_ascii(string)
    26.times do |shift|
      puts decipher_ascii(string, shift)
    end
  end
    
  def self.cipher_unicode(string, shift)
    byte_array = string.codepoints.map do |char|
        (char + shift) % (MAX_UNICODE + 1)
    end
    
    byte_array.pack("C*")
  end

  def self.decipher_unicode(string, shift)
    byte_array = string.codepoints.map do |char|
        (char - shift) % (MAX_UNICODE + 1)
    end
    
    byte_array.pack("C*")
  end 
end
cipherUTF8 = CaesarCipher.cipher_unicode("What a string!", 200)
puts cipherUTF8
puts CaesarCipher.decipher_unicode(cipherUTF8, 200)


