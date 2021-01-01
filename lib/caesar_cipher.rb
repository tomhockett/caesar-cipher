class String
  def capital?
    ord.between?(65, 90)
  end

  def lowercase?
    ord.between?(97, 122)
  end

  def ord_with(shift)
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
        str << if char.lowercase? || char.capital?
                 char.ord_with(shift)
               else
                 char
               end
      end
    end
  end
end
