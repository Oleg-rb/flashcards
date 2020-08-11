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
    @card.review_date

    if @card.save
      redirect_to @card, success: 'Карточка успешно созданна'
    else
      flash.now[:danger] = 'Карточка не обновлена'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @card.update_attributes(card_params)
      redirect_to @card, success: 'Карточка успешно обновлена'
    else
      flash.now[:danger] = 'Карточка не обнавлена'
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path, success: 'Карточка успешно удалена'
  end

  private

  def set_post
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end
