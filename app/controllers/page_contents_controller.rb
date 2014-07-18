class PageContentsController < ActionController::Base
  def update
    params[:content].each do |name, attrs|
      Cinnabar::PageContent.find_or_create_by_name(name).update_attribute(:content, attrs[:value])
    end
    render text: ''
  end
end
