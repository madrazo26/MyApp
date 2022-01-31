# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :set_question!
  before_action :set_answer!, except: :create

  def edit; end

  def update
    if @answer.update answer_params
      flash[:success] = 'Answer updated!'
      redirect_to waybill_path(@waybill, anchor: "answer-#{@answer.id}")
    else
      render :edit
    end
  end

  def create
    @answer = @waybill.answers.build answer_params
    if @answer.save
      flash[:success] = 'Answer created!'
      redirect_to waybill_path(@waybill)
    else
      @answers = @waybill.answers.order(created_at: :desc).page(params[:page])
      render 'waybills/show'
    end
  end

  def destroy
    @answer.destroy
    flash[:success] = 'Answer deleted!'
    redirect_to waybill_path(@waybill)
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_question!
    @waybill = Waybill.find params[:question_id]
  end

  def set_answer!
    @answer = @waybill.answers.find params[:id]
  end
end
