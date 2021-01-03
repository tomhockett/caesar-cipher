# frozen_string_literal: false

# We don't want frozen strings since the whole point is to modify strings.
# yes 'false' is default but i'm being explicit on purpose.

# String#is_a_letter? => true/false
# String#ord_with(14) => integer ordinal shifted by 14
class String
  def is_a_letter?
    (ord.between?(65, 90) || ord.between?(97, 122))
  end

  def ord_with(shift = 0)
    integer_ordinal = self.ord
    base = integer_ordinal < 91 ? 65 : 97
    shifted_char = (integer_ordinal - base) + shift

    (shifted_char % 26) + base
  end
end

class CaesarCipher
  def translate(phrase, shift)
    ''.tap do |str|
      phrase.each_char do |char|
        # '<<' will convert integer ordinals for you, '+=' will not.
        str << if char.is_a_letter?
                 char.ord_with(shift)
               else
                 char
               end
      end
    end
  end
end
