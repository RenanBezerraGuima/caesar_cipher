# caesar_cipher
Named after Julius Caesar, who used it in his private correspondence.
In cryprography, a Caesar cipher is a type of substitution cipher in which each letter in the text is replaced by a letter some fixed number of positions down the alphabet.

# Example:
Left shift of 3, D would be replaced by A, E would become B, and so on.
Run `ruby example_usage.rb` to see the module on action

The module uses a right shift
# ASCII
- Wraps from z to a
- Maintains the same case
- Symbols not on the alphabet remain unchanged

# Formula
- Gets the ASCII int representation of the char
- normalizes it to a alphabetical 0..25
- Adds the right shift expected
- Gets the module of it by diving with the total number of letter in the alphabet
- Finally denormalizes it by adding its base

# Unicode
- Wraps from the whole unicode range
- Does a right shift on **all** characters

# Decipher
- ASCII cipher with a given right shift
- ASCII cipher via brute force
- Unicode cipher with a given right shift
