class SharedTextsController < ApplicationController
  def index
    @shared_texts = SharedTexts.all
  end

  def create
    @shared_texts = SharedTexts.new(shared_texts_params)
    if @shared_texts.save
      redirect_to shared_texts_path
    else
      render :indexe
    end
  end

  private

  def shared_texts_params
    params.require(:shared_texts).permit(:content)
  end
end
