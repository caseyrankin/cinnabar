module Cinnabar
  module ApplicationHelper
    def page_content(content_name, tag_type = :span, mercury_type = 'full', &block)
      @page_content_used = true
      # prefix db key with controller/action names to sorta help with uniqueness
      content_name = [controller_name, action_name, content_name.underscore].join('_').to_sym
      content = Cinnabar::Content[content_name].try(:html_safe)
      # use html inside block if record does not exist
      content = capture(&block).html_safe if block_given? && content.nil?
      content_tag(tag_type, content, data: { mercury: mercury_type }, id: content_name)
    end

    def show_edit_link?
      !params[:mercury_frame] && @page_content_used
    end

    def edit_link
      if show_edit_link?
        content_tag(:div, link_to('This page has editable content, click here to edit', '/editor' + request.path), class: 'editor-link')
      end
    end
  end
end
