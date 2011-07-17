class SwimmersController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :show]
  
  # GET /swimmers
  # GET /swimmers.xml
  def index
    @event = Event.find(params[:event_id])
    @swimmers = @event.swimmers.all(:order => 'secname ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @swimmers }
    end
  end

  # GET /swimmers/1
  # GET /swimmers/1.xml
  def show
    @event = Event.find(params[:event_id])
    @swimmer = Swimmer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @swimmer }
    end
  end

  # GET /swimmers/new
  # GET /swimmers/new.xml
  def new
    @event = Event.find(params[:event_id])
    @swimmer = @event.swimmers.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @swimmer }
    end
  end

  # GET /swimmers/1/edit
  def edit
    @event = Event.find(params[:event_id])
    @swimmer = Swimmer.find(params[:id])
  end

  # POST /swimmers
  # POST /swimmers.xml
  def create
    @event = Event.find(params[:event_id])
    @swimmer = @event.swimmers.new(params[:swimmer])

    respond_to do |format|
      if @swimmer.save
        format.html { redirect_to(event_swimmer_url(@event,@swimmer), :notice => 'Inscripcion creada correctamente.') }
        format.xml  { render :xml => @swimmer, :status => :created, :location => @swimmer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @swimmer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /swimmers/1
  # PUT /swimmers/1.xml
  def update
    @event = Event.find(params[:event_id])
    @swimmer = Swimmer.find(params[:id])

    respond_to do |format|
      if @swimmer.update_attributes(params[:swimmer])
        format.html { redirect_to(event_swimmers_url(@event), :notice => 'Swimmer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @swimmer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /swimmers/1
  # DELETE /swimmers/1.xml
  def destroy
    @event = Event.find(params[:event_id])
    @swimmer = Swimmer.find(params[:id])
    @swimmer.destroy

    respond_to do |format|
      format.html { redirect_to(event_swimmers_url(@event)) }
      format.xml  { head :ok }
    end
  end
end
