module Cinnabar
  module ApplicationHelper
    def cinnabar_prepend_path(path)
      @prepend_path = path
    end

    def liquid(name, options = nil, &block)
      @page_content_used = true
      options ||= {}
      options[:tag] ||= :span
      options[:mercury_type] ||= 'full'

      # prefix db key with controller/action names to sorta help with uniqueness
      db_name = [controller_name, action_name, @prepend_path, name.underscore].compact.join('_').to_sym
      content = Cinnabar::Content[db_name].try(:html_safe)

      # use html inside block if record does not exist
      content = capture(&block).html_safe if block_given? && content.nil?

      content_tag(options[:tag].to_sym, content, data: { mercury: options[:mercury_type] }, id: db_name)
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
