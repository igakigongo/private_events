class EventsController < ApplicationController
  include ApplicationHelper
  before_action :authorize, except: %i[index]
  before_action :set_event, only: %i[edit destroy update]
  before_action :validate_ownership, only: %i[edit destroy update]
  def default_query_options
    { past: false }
  end

  # GET /events
  # GET /events.json
  def index
    @events = if params[:past]
                Event.is_past
              else
                Event.is_not_past
              end
    @past = params[:past]
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.includes(:creator, event_attendances: [:attendee]).find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  # POST /events.json
  def create
    user = principal
    @event = user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def authorize
    return if principal

    flash[:error] = 'You need to sign in before carrying out the intended action'
    redirect_to signin_path
  end

  def event_params
    params.require(:event).permit(:date, :title)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def validate_ownership
    return if @event.user_id == principal.id

    redirect_to events_path, notice: 'You attempted to modify a resource that does not belong to you'
  end
end
