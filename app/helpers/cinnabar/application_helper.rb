module Cinnabar
  module ApplicationHelper
    include Cinnabar::Authentication

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

      # transform = <<-eos
      #   <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> <xsl:output method="xml" encoding="ISO-8859-1"/> <xsl:param name="indent-increment" select="'   '"/> <xsl:template name="newline"> <xsl:text disable-output-escaping="yes"> </xsl:text> </xsl:template> <xsl:template match="comment() | processing-instruction()"> <xsl:param name="indent" select="''"/> <xsl:call-template name="newline"/> <xsl:value-of select="$indent"/> <xsl:copy /> </xsl:template> <xsl:template match="text()"> <xsl:param name="indent" select="''"/> <xsl:call-template name="newline"/> <xsl:value-of select="$indent"/> <xsl:value-of select="normalize-space(.)"/> </xsl:template> <xsl:template match="text()[normalize-space(.)='']"/> <xsl:template match="*"> <xsl:param name="indent" select="''"/> <xsl:call-template name="newline"/> <xsl:value-of select="$indent"/> <xsl:choose> <xsl:when test="count(child::*) > 0"> <xsl:copy> <xsl:copy-of select="@*"/> <xsl:apply-templates select="*|text()"> <xsl:with-param name="indent" select="concat ($indent, $indent-increment)"/> </xsl:apply-templates> <xsl:call-template name="newline"/> <xsl:value-of select="$indent"/> </xsl:copy> </xsl:when> <xsl:otherwise> <xsl:copy-of select="."/> </xsl:otherwise> </xsl:choose> </xsl:template> </xsl:stylesheet>"
      # eos
      # xsl = Nokogiri::XSLT(transform)
      # html = Nokogiri(content)
      # content = xsl.apply_to(html).to_s.html_safe

      content_tag(options[:tag].to_sym, content, data: { mercury: options[:mercury_type] }, id: db_name)
    end

    def show_edit_link?
      params[:mercury_frame].nil? && @page_content_used && has_edit_permissions?
    end

    def edit_link
      if show_edit_link?
        content_tag(:div,
                    link_to('Edit the content on this page <span>&crarr;</span>'.html_safe, '/editor' + request.path),
                    class: 'editor-link')
      end
    end
  end
end
