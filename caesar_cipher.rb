# In cryprography, a Caesar cipher is a type
# of substitution cipher in which each letter
# in the text is replaced by a letter some
# fixed number of positions down the alphabet.
# Named after Julius Caesar, who used it in
# his private correspondence.

# Example:
# Left shift of 3, D would be replaced by A,
# E would become B, and so on.

# The method uses a right shift
# Should wrap from z to a
# Should maintain the same case
# Symbols not on the alphabet remain unchanged

# Formula
# Gets the ASCII/UTF-8 inte representation of the char
# normalizes it to a alphabetical 0..25
# Adds the shift expected
# Gets the module of it by diving with the total
# number of letter in the alphabet
# Finally denormalizes it by adding its base 

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

# Sambple usage
cipher = CaesarCipher.cipher_ascii("What a string!", 5)
puts cipher
puts CaesarCipher.decipher_ascii(cipher, 5)

puts "Cipher UTF8 ----"

cipherUTF8 = CaesarCipher.cipher_unicode("What a string!", 200)
puts cipherUTF8
puts CaesarCipher.decipher_unicode(cipherUTF8, 200)

puts "Brute Force Decipher ASCII:"
CaesarCipher.brute_force_decipher_ascii(cipher)
