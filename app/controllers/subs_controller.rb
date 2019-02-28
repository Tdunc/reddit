class SubsController < ApplicationController
# Views for user interaction, logic kept at minimum
# Controller and routes for directing traffic, actions
# Model ways to manipulate database and table/record
# Skinny Controllers / Fat Models -rails(slang)

# shows all items within the model
## index @model_names = Model_name.all

# search for particular record to update / renders edit form
## edit @model_name = Model_name.find(params[:id])

# searches for particular record, shows specific(single)
## show @model_name = Model_name.find(params)[:id])

# creates a record in memory / renders the new form
## new @model_name = Model_name.new

# will post onto database
## create Model_name.create(model_name_params)

# Update /put or patch
## update Model_name.find(params[:id]).update(model_name_params)

# destroy / delete
## destroy Model_name.find(params)[:id].destroy

# Callbacks 
## before_action, after_action, skip_before_action, skip_after_action, 

before_action :find_sub, only: [:show, :edit, :update, :destroy]

  def index
    @subs = Sub.all
  end

  def show
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)

    if @sub.save
      redirect_to subs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sub.update(sub_params)
      redirect_to @sub
      else
        render :edit
      end
  end
  
  def destroy
    @sub.destroy
    redirect_to subs_path
  end

  private
  def sub_params
    params.required(:sub).permit(:name)
  end

  def find_sub
    @sub = Sub.find(params[:id])
  end
end
