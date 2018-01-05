require 'api_constraints'

Api::Application.routes.draw do

  mount SabisuRails::Engine => "/sabisu_rails"
  devise_for :users
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do

    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do

      resources :users, :only => [:show, :create, :update, :destroy, :index] do
        resources :trips, :only => [:show, :index, :create, :update, :destroy]
      end

      resources :sessions, :only => [:create, :destroy]
      resources :trips, :only => [:show, :index]
    end

  end

end