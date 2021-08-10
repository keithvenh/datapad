class TalentsController < ApplicationController
  
  layout 'admin'

  def index
    @talents = Talent.all.order(:name)
  end

  def new
    @talent = Talent.new
  end

  def create
    @talent = Talent.new(talent_params)
    if @talent.save!
      flash[:notice] = "You have successfully created #{@talent.name}."
      redirect_to talents_path
    else
      flash.now[:alert] = "Beep Boop. Something Went Wrong."
      render 'new'
    end
  end

  def edit
    @talent = Talent.find(params[:id])
  end

  def update
    @talent = Talent.find(params[:id])
    if @talent.update(talent_params)
      flash[:notice] = "You have successfully updated #{@talent.name}."
      redirect_to talents_path
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'edit'
    end
  end

  private

    def talent_params
      params.require(:talent).permit(:name, :active, :activation_type, :shortDesc, :longDesc, :force, :ranked, :book_id)
    end
end
