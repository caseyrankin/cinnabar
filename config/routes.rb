Cinnabar::Engine.routes.draw do

  mount Mercury::Engine => '/'

  resource :contents, only: [:update]

end
