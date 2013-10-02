module V1
  class UnitsController < ApplicationController
    def index
      @units = Unit.all #filter for curriculum
    end
  end
end