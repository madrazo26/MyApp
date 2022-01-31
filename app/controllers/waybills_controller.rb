# frozen_string_literal: true

class WaybillsController < ApplicationController
  before_action :set_question!, only: %i[show destroy edit update]
  def edit; end

  def show
    @answer = @waybill.answers.build
    @answers = @waybill.answers.order(created_at: :desc).page(params[:page]).per(5)
  end

  def destroy
    @waybill.destroy
    flash[:success] = 'Waybill deleted!'
    redirect_to waybills_path
  end

  def update
    if @waybill.update question_params
      flash[:success] = 'Waybill updated!'
      redirect_to waybills_path
    else
      render :edit
    end
  end

  def index
    @waybills = Waybill.order(created_at: :desc).page params[:page]
  end

  def new
    @waybill = Waybill.new
  end

  def create
    @waybill = Waybill.new question_params
    if @waybill.save
      flash[:success] = 'Question created!'
      redirect_to waybills_path
    else
      render :new

    end
  end

  private

  def question_params
    params.require(:waybill).permit(:title, :body)
  end

  def set_question!
    @waybill = Waybill.find params[:id]
  end
end
