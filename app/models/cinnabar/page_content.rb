class Cinnabar::PageContent < ActiveRecord::Base
  attr_accessible :content, :name

  self.table_name = :page_contents

  def self.[](name)
    Cinnabar::PageContent.find_by_name(name.to_s).try(:content)
  end
end
