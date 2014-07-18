Cinnabar::Engine.routes.draw do

  mount Mercury::Engine => '/'

  resource :page_contents, only: [:update]

end
