require_relative 'caesar_cipher'

EXAMPLE_STRING = "What a string!"

puts "Cipher/Decipher ASCII:"
cipher = CaesarCipher.cipher_ascii("What a string!", 5)
puts "Cipher of #{EXAMPLE_STRING} = " + cipher
puts "Decipher of #{cipher} = " + CaesarCipher.decipher_ascii(cipher, 5)

puts

puts "Brute Force Decipher of ASCII #{cipher}:"
CaesarCipher.brute_force_decipher_ascii(cipher)

puts

puts "Cipher/Decipher Unicode:"
cipherUnicode = CaesarCipher.cipher_unicode("What a string!", 200)
puts "Cipher of #{EXAMPLE_STRING} = " + cipherUnicode
puts "Decipher of #{cipherUnicode} = " + CaesarCipher.decipher_unicode(cipherUnicode, 200)
