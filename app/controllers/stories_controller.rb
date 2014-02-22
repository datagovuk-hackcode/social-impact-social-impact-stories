class StoriesController < InheritedResources::Base

  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def show

  end

  def create
    @story = Story.new(story_params)
    respond_to do |format|
      if @story.save
        format.html { redirect_to story_url(@story), notice: 'Story created' }
        format.json { render action: 'show', status: :created, location: @story }
      else
        format.html { render action: 'new' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to story_url(@story), notice: 'Story was successfully updated.' }
        format.json { render json: @story }
      else
        format.html { render action: 'edit' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_story
      @story = Story.find_by_id(params[:id])
    end

    def story_params
      params.require(:story).permit(
        :content,
        :organisation_id
      )
    end

end
