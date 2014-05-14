ActivePortal::Engine.routes.draw do
  devise_for :users, class_name: 'ActivePortal::User', module: :devise
end
