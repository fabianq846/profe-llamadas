class ApplicationController < ActionController::Base
    Pagy::DEFAULT[:clients] = 10
    include Pagy::Backend
end
