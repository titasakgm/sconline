class DataedsController < ApplicationController
  # GET /dataeds
  # GET /dataeds.xml
  def index
    if params[:search]
      @dataeds = Dataed.where(["lower(datacode || parent || subject || url) LIKE ?", 
        "%#{params[:search].downcase}%"]).order(:datacode).paginate(
          :page => params[:page], :per_page => 20)
    else
      @dataeds = Dataed.order(:datacode).paginate :page => params[:page], :per_page => 20
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dataeds }
      format.json  { 
        render :json => Dataed.all
      }
    end
  end

  # GET /dataeds/1
  # GET /dataeds/1.xml
  def show
    @dataed = Dataed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dataed }
      format.json  { render :json => @dataed }
    end
  end

  # GET /dataeds/new
  # GET /dataeds/new.xml
  def new
    @dataed = Dataed.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dataed }
      format.json  { render :json => @dataed }
    end
  end

  # GET /dataeds/1/edit
  def edit
    @dataed = Dataed.find(params[:id])
  end

  # POST /dataeds
  # POST /dataeds.xml
  def create
    @dataed = Dataed.new(params[:dataed])

    respond_to do |format|
      if @dataed.save
        format.html { redirect_to(@dataed, :notice => 'Dataed was successfully created.') }
        format.xml  { render :xml => @dataed, :status => :created, :location => @dataed }
        format.json  { render :json => @dataed, :status => :created, :location => @dataed }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dataed.errors, :status => :unprocessable_entity }
        format.json  { render :json => @dataed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dataeds/1
  # PUT /dataeds/1.xml
  def update
    @dataed = Dataed.find(params[:id])

    respond_to do |format|
      if @dataed.update_attributes(params[:dataed])
        format.html { redirect_to(@dataed, :notice => 'Dataed was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dataed.errors, :status => :unprocessable_entity }
        format.json  { render :json => @dataed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dataeds/1
  # DELETE /dataeds/1.xml
  def destroy
    @dataed = Dataed.find(params[:id])
    @dataed.destroy

    respond_to do |format|
      format.html { redirect_to(dataeds_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
