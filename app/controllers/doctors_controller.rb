class DoctorsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def index
    @doctors = Doctor.all
  end

  def search
    @q = Doctor.where("name LIKE ?", "%#{params[:q]}%")
  end

  def new
    @doctor = Doctor.new
  end

  def show
    @doctor = Doctor.find(params[:id])
    @clinic = Clinic.where("doctor_id = ?", params[:id])
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def create
    @doctor = Doctor.new(doctor_params)
       
    if @doctor.save
      redirect_to @doctor
    else
      render 'new'
    end
  end

  def update
    @doctor = Doctor.find(params[:id])
       
    if @doctor.update(doctor_params)
      redirect_to @doctor
    else
      render 'edit'
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    
    redirect_to doctors_path
  end

  def import
    file = params[:file].tempfile
    spreadsheet = Roo::Excelx.new(file).to_a
    spreadsheet.each do |item_array|
      id = item_array[0]
      name = item_array[1]
      spec = item_array[2]
      address = item_array[3]
      item = Doctor.find_or_create_by(id: id)

      item.update(name: name, spec: spec, address: address)
    end
    redirect_to doctors_path

  end

  private
    def doctor_params
      params.require(:doctor).permit(:name, :spec, :address)
    end
  end
