class StaticPagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  def index
  end
end
