class Admin::FamiliesController < ApplicationController
  before_filter :require_user

  # GET /families
  # GET /families.xml
  def index
    @families = Family.order(:name).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @families }
    end
  end

  # GET /families/1
  # GET /families/1.xml
  def show
    @family = Admin::Family.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @family }
    end
  end

  # GET /families/new
  # GET /families/new.xml
  def new
    @family = Admin::Family.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @family }
    end
  end

  # GET /families/1/edit
  def edit
    @family = Admin::Family.find(params[:id])
  end

  # POST /families
  # POST /families.xml
  def create
    @family = Admin::Family.new(params[:admin_family])

    respond_to do |format|
      if @family.save(false)
        format.html { redirect_to(@family, :notice => 'Admin::Family was successfully created.') }
        format.xml  { render :xml => @family, :status => :created, :location => @family }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @family.errors, :status => :unprocessable_entity }
      end
    end
  end

# PUT /families/1
  # PUT /families/1.xml
  def update
    @family = Admin::Family.find(params[:id])

    respond_to do |format|
      @family.attributes = params[:admin_family]
      if @family.save(false)
        format.html { redirect_to(@family, :notice => 'Admin::Family was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @family.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /families/1
  # DELETE /families/1.xml
  def destroy
    @family = Admin::Family.find(params[:id])
    @family.destroy

    respond_to do |format|
      format.html { redirect_to(admin_families_url) }
      format.xml  { head :ok }
    end
  end

end 
