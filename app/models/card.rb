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
    errors[:base] << 'Не переведено!' if (original_text =~ /^[A-Za-z]/) && (translated_text =~ /^[A-Za-z]/)
  end

  def translated
    errors[:base] << 'Одинаковые значения!' if original_text.eql? translated_text
  end

  def russ
    errors[:base] << 'Не переведено!' if (original_text =~ /^[А-Яа-я]/) && (translated_text =~ /^[А-Яа-я]/)
  end
end
