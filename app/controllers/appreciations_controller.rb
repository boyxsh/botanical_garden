class AppreciationsController < ApplicationController
  # GET /appreciations
  # GET /appreciations.xml
  def index
    @appreciations = Appreciation.all(:include => :category)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @appreciations }
    end
  end

  # GET /appreciations/1
  # GET /appreciations/1.xml
  def show
    @appreciation = Appreciation.find(params[:id],:include => :category)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @appreciation }
    end
  end

  # GET /appreciations/new
  # GET /appreciations/new.xml
  def new
    @appreciation = Appreciation.new
    @category = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @appreciation }
    end
  end

  # GET /appreciations/1/edit
  def edit
    @appreciation = Appreciation.find(params[:id])
  end

  # POST /appreciations
  # POST /appreciations.xml
  def create
    @appreciation = Appreciation.new(params[:appreciation])

    respond_to do |format|
      if @appreciation.save
        format.html { redirect_to(@appreciation, :notice => 'Appreciation was successfully created.') }
        format.xml  { render :xml => @appreciation, :status => :created, :location => @appreciation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @appreciation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /appreciations/1
  # PUT /appreciations/1.xml
  def update
    @appreciation = Appreciation.find(params[:id])

    respond_to do |format|
      if @appreciation.update_attributes(params[:appreciation])
        format.html { redirect_to(@appreciation, :notice => 'Appreciation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @appreciation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /appreciations/1
  # DELETE /appreciations/1.xml
  def destroy
    @appreciation = Appreciation.find(params[:id])
    @appreciation.destroy

    respond_to do |format|
      format.html { redirect_to(appreciations_url) }
      format.xml  { head :ok }
    end
  end

  def search
    @appreciations = Appreciation.search_by(params[:search])
    render :action => "index" , :collection => @appreciations
  end
end
