module V1
  class GradebooksController < ApplicationController
    # For now this will do til we consider multiple gradebooks per user
    def show
      @gradebook = current_user.gradebooks.first
    end
  end
end