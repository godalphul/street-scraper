class StreetsController < ApplicationController
  before_action :set_street, only: [:show, :update]
  require 'will_paginate/array'
  
  # GET /streets
  # GET /streets.json
  def index
    @streets = Street.order(name: "ASC").paginate(:page => params[:page], :per_page => 30)
    #.limit(10)
  end

  # GET /streets/1
  # GET /streets/1.json
  def show
  end

  # GET /streets/new
  def new
    @street = Street.new
  end

  

  # POST /streets
  # POST /streets.json
  def create
    @street = Street.new(street_params)

    respond_to do |format|
      if @street.save
        format.html { redirect_to @street, notice: 'Street was successfully created.' }
        format.json { render :show, status: :created, location: @street }
      else
        format.html { render :new }
        format.json { render json: @street.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /streets/1
  # PATCH/PUT /streets/1.json
  def update
    respond_to do |format|
      if @street.update(street_params)
        format.html { redirect_to @street, notice: 'Street was successfully updated.' }
        format.json { render :show, status: :ok, location: @street }
      else
        format.html { render :edit }
        format.json { render json: @street.errors, status: :unprocessable_entity }
      end
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_street
      @street = Street.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def street_params
      params.require(:street).permit(:name)
    end
end
