module V1
  class UnitsController < ApplicationController
    def index
      @units = Unit.with_subject.scoped #filter for curriculum
      fresh_when @units.maximum(:updated_at)
        
    end
  end
end