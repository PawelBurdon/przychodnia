class VisitsController < ApplicationController
  def index
    @visits = Visit.order(data: :asc)
  end

  def new
    @clinics = Clinic.all
    @visit = Visit.new
  end

  def create

    @visit = Visit.new(visits_params)
    @visit.user_id = current_user.id
    
    if @visit.save
      redirect_to visits_path
    else
      render plain: "nie dziala"
    end
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
 
    redirect_to visits_path
  end

  private
  def visits_params
    params.require(:visit).permit(:description, :data, :clinic_id)
  end
end
