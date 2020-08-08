# frozen_string_literal: true

# Base controller of application
class CardsController < ApplicationController

  before_action :set_post, only: [ :show, :edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new card_params
    if @card.save
      redirect_to @card, success: 'Карточка успешно созданна'
    else
      flash.now[:danger] = 'Карточка не обновлена'
      render :new
    end
  end

  def show
  end

  private

  def set_post
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end
end
