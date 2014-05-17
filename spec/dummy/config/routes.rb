Rails.application.routes.draw do
  root 'pages#home'
  mount ActivePortal::Engine => '/active_portal'
end
