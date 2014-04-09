class LinksController < ApplicationController
  before_action :authenticate_user!, only: :create

  def new
    @language = Language.find_by_slug(params[:language]) || not_found
    @newLink = Link.new
  end

  def show
    @link = Link.find(params[:id])
    @newLink = Link.new

    @language = @link.tag.language
    render '/languages/show'
  end


  def create
    @newLink = current_user.links.build(link_params)
    @language = Language.find(link_params['language'].to_i)

    if @newLink.save

      Tag.create do |t|
        t.link_id = @newLink.id
        t.language_id = @language.id
      end
      flash[:new_link_id] = @newLink.id
      redirect_to language_link_path(@newLink.tag.language, @newLink)
    else
      flash[:error] = @newLink.errors.full_messages.join(", ")
      render 'new'
    end

  end

  private

  def link_params
    params.require(:link).permit(:url, :description, :title, :level, :free, :language)
  end

end
