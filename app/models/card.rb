# frozen_string_literal: true

class Card < ApplicationRecord
  validates :original_text, presence: { message: 'Введите оригинальное слово' }
  validates :translated_text, presence: { message: 'Введите перевод слова' }
  validates :original_text, :translated_text, uniqueness: { message: 'Такой перевод уже существует' }

  before_create :recheck_date


  def recheck_date
    self.review_date = (Date.today + 3.days)
  end

  validate :original, :translated, :russ
  def original
    if (original_text =~ /^[A-Za-z]/) && (translated_text =~ /^[A-Za-z]/)
      errors[:base] << 'Не переведено!'
    end
  end

  def translated
    if original_text == translated_text
      errors[:base] << 'Одинаковые значения!'
    end
  end

  def russ
    if (original_text =~ /^[А-Яа-я]/) && (translated_text =~ /^[А-Яа-я]/)
      errors[:base] << 'Не переведено!'
    end
  end
end
