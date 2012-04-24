require 'csv'
class EntriesController < ApplicationController
  # GET /entries
  # GET /entries.json
  def index
    puts params
    @day = Date.parse(params[:week_selector]) rescue nil
    @day = Date.today if @day.nil?
    @monday= @day.beginning_of_week
    @friday = @monday.end_of_week - 2    
    @entries = current_user.entries.get_week_for(@monday)
    @next_week = @day.next_week
    @previous_week = (@monday - 3).beginning_of_week

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = current_user.entries.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = Entry.new
    @entry.day = Date.parse(params[:day]) unless params[:day].nil?
    @yesterday_data = current_user.entries.find_by_day(@entry.day-1.day) unless params[:day].nil?
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = current_user.entries.find(params[:id])
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(params[:entry])
    @entry.user = current_user

    respond_to do |format|
      if @entry.save
        #format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.html { redirect_to entries_path(:week_selector=>@entry.day), notice: 'Entry was successfully created.' }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    @entry = current_user.entries.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        #format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.html { redirect_to entries_path(:week_selector=>@entry.day), notice: 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def export
    csv_string = CSV.generate do |csv|\
      csv << ["day", "yesterday", "today", "roadblocks"]
      current_user.entries.all.each do |entry|
        csv << [entry.day, entry.yesterday, entry.today, entry.roadblocks]
      end
    end
    send_data csv_string,
              :filename => "data_"+Date.today.to_s+".csv",
              :type => "application/csv"
    
  end

  def today
    now = Date.today
    respond_to do |format|
      if entry=current_user.entries.find_by_day(now)
        format.html{ redirect_to edit_entry_path(entry)}
      else
        format.html{ redirect_to new_entry_path(:day=>now)}
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = current_user.entries.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :no_content }
    end
  end
  
end
