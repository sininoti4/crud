class SinsController < ApplicationController
  
  def index
    @sins = Sin.all
  end

  def show
    @sin = Sin.find(params[:id])
    @coment = Coment.new
  end

  def edit
     @sin =Sin.find(params[:id])
  end

  def update
    @sin =Sin.find(params[:id])
    if @sin.update(sin_params)
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :edit
    end
  end
  
  def new
    @sin = Sin.new
  end
  
  def create
    @sin = Sin.new(sin_params)
    if @sin.save
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :new
    end
  end
  
  def destroy
    @sin = Sin.find(params[:id])
    @sin.destroy
    redirect_to root_path, notice: 'Success!'
  end







  private


  def sin_params
    params.require(:sin).permit(:title, :content)
  end
  
  
    
end
