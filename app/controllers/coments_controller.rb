class ComentsController < ApplicationController

  
  def create
    @sin = Sin.find(params[:sin_id])
    @coment = Coment.new
    if @coment.update(coment_params)
      redirect_to sin_path(@sin), notice: 'Success!'
    else
      redirect_to sin_path(@sin), alert: 'Invalid!'
    end
  end
  
  def edit
    @sin = Sin.find(params[:sin_id])
    @coment = @sin.coments.find(params[:id])
  end
  
  def update
    @sin = Sin.find(params[:sin_id])
    @coment = @sin.coments.find(params[:id])
    if @coment.update(coment_params)
      redirect_to sin_path(@sin), notice: 'Success!'
    else
      flash[:alert] = 'Invalid!'
      render :edit
    end
  end
  
  def destroy
    @sin = Sin.find(params[:sin_id])
    @coment = @sin.coments.find(params[:id])
    @coment.destroy
    redirect_to sin_path(@sin), notice: 'Deleted!'
  end
  
  private
    def coment_params
      params.require(:coment).permit(:content, :name, :sin_id)
    end


end
