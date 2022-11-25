class ClinicsController < ApplicationController

  def index
    @clinics = Clinic.all
  end

  def search
    @q = Clinic.where("clinic_type LIKE ?", "%#{params[:q]}%")
  end

  def show
    @clinic = Clinic.find(params[:id])
    @user = Clinic.where(user_id: current_user.id)
    
  end

  def new
    @clinic = Clinic.new
  end

  def edit
    @clinic = Clinic.find(params[:id])
  end

  def create
    @clinic = Clinic.new(clinic_params)
      
    if @clinic.save
      redirect_to @clinic
    else
      render 'new'
    end

  end

  def update
    @clinic = Clinic.find(params[:id])
      
    if @clinic.update(clinic_params)
      redirect_to @clinic
    else
      render 'edit'
    end
  end

  def destroy
    @clinic = Clinic.find(params[:id])
    @clinic.destroy
  
    redirect_to clinics_path
  end

  def export
    @clinics = Clinic.all
    render xlsx: "create", template: "clinics/export"
  end


  private
    def clinic_params
      params.require(:clinic).permit(:number, :clinic_type, :doctor_id, :data, :image)
    end

end