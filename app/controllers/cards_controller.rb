# frozen_string_literal: true

# Base controller of application
class CardsController < ApplicationController
  def index
    @cards = Card.all
  end
end
