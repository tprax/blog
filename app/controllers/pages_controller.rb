class PagesController < ApplicationController
  def index
    @pages = Page.order(created_at: :asc)
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to page_path(@page.id)
    else
      render :new
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
      redirect_to page_path(@page.id)
    else
      render :edit
    end
  end

  def destroy
    Page.find(params[:id]).destroy
    redirect_to pages_path
  end

  private

    def page_params
      params.require(:page).permit(:title, :author, :body)
    end
end
