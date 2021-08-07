class CareersController < ApplicationController

  layout 'admin'

  def index
    @careers = Career.all.order(:name)
  end

  def edit
    @career = Career.find(params[:id])
  end

  def update
    @career = Career.find(params[:id])
    if @career.update(career_params)
      flash[:notice] = "You have successfully updated #{@career.name}."
      redirect_to @career
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'edit'
    end
  end

  def show
    @career = Career.find(params[:id])
  end

  private

    def career_params
      params.require(:career).permit(:name, :book_id)
    end

end
