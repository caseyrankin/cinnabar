class Cinnabar::Content < ActiveRecord::Base
  attr_accessible :content, :name

  self.table_name = :cinnabar_contents

  def self.[](name)
    Cinnabar::Content.find_by_name(name.to_s).try(:content)
  end
end
