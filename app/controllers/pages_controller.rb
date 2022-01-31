# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @name = params[:name]
  end
end
