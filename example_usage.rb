require 'caesar_cipher'

# Sample usage
puts "Cipher/Decipher ASCII:"

cipher = CaesarCipher.cipher_ascii("What a string!", 5)
puts cipher
puts CaesarCipher.decipher_ascii(cipher, 5)

puts "Brute Force Decipher ASCII:"
CaesarCipher.brute_force_decipher_ascii(cipher)

puts "Cipher/Decipher Unicode:"
