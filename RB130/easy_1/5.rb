require 'pry'
=begin
# ENCRYPTED PIONEERS -- REDO BY ROTATING THE ARRAY
RULES:
- ROT13 - replace every letter with the 13th letter after it in the alphabet (wrapping around)
- match/preserve case
- preserve spaces/non-alphabetical letters (hyphen)

DATA STRUCTURE:
- array of alphabet, offset by 13 (start with N)
- array of original alphabet


EXAMPLES:
Nqn Ybirynpr

Ada Lovelace

Ob-o
Bo-b

- convert to lowercase
- get index in shifted alphabet
  - idx 1
- get index in original alphabet
  - idx 1: B

- create a new string
  - if char is not a letter, push in that char
  - if char is a letter, push in value from regular alphabet (match case)
    - check if original shifted letter is uppercase -> if yes, push value.upcase from regular alphabet, otherwise lowercase
- add string to result array
=end
# Original
# def decode(names)
#   regular_alpha = ('a'..'z').to_a
#   shifted_alpha = ('n'..'z').to_a + ('a'..'m').to_a

#   names.map do |name|
#     decoded_name = ''

#     name.chars.each do |char|
#       if /[a-zA-z]/ =~ char
#         char_index = shifted_alpha.index(char.downcase)
#         decoded_char = regular_alpha[char_index]

#         decoded_name << (char == char.upcase ? decoded_char.upcase : decoded_char)
#       else
#         decoded_name << char
#       end
#     end

#     decoded_name
#   end
  
# end


# Rotating Array
def decode_character(char)
  alphabet = ('a'..'z').to_a
  index = alphabet.rotate(13).index(char.downcase)
  alphabet[index]
end

def decode(names)
  names.map do |name|
    decoded_name = ''
    name.chars.each do |char|
      if /[a-zA-z]/ =~ char
        decoded_char = decode_character(char)
        decoded_name << (char == char.upcase ? decoded_char.upcase : decoded_char)
      else
        decoded_name << char
      end
    end
    decoded_name
  end 
end

names = ['Nqn Ybirynpr', 'Tenpr Ubccre', 'Nqryr Tbyqfgvar', 'Nyna Ghevat', 'Puneyrf Onoontr', 'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv', 'Wbua Ngnanfbss', 'Ybvf Unvog', 'Pynhqr Funaaba', 'Fgrir Wbof', 'Ovyy Tngrf', 'Gvz Orearef-Yrr', 'Fgrir Jbmavnx', 'Xbaenq Mhfr', 'Fve Nagbal Ubner', 'Zneiva Zvafxl', 'Lhxvuveb Zngfhzbgb', 'Unllvz Fybavzfxv', 'Tregehqr Oynapu']


ada = "Nqn Ybirynpr"
bob = "Ob-o"

p decode(names)