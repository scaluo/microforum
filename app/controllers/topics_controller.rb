class TopicsController < ApplicationController
  before_filter :authenticate_user!,only: [:new,:create,:update,:destroy,:edit]
  before_filter :only_my_topic,only: [:update,:destroy,:edit]
  before_filter :get_categories
  layout 'topic'
  # GET /topics
  # GET /topics.json
  def index

    if params[:category_id]
      @topics = Topic.where(:category_id =>params[:category_id]).order('id desc').paginate(:page => params[:page])
    else
     # @posts = Post.paginate(:page => params[:page])
      @topics = Topic.order('id desc').paginate(:page => params[:page])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = Topic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    @topic = Topic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit

  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = current_user.topics.build(params[:topic])


    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update


    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy

    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :ok }
    end
  end

  protected
  def only_my_topic
    @topic = current_user.topics.find(params[:id])
  end

  def get_categories
   @categories = Category.all

  end
end
