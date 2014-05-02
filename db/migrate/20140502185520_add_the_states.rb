class AddTheStates < ActiveRecord::Migration
  def change
    
    parent = Curriculum.find_by_title "US - Common Core"
    Curriculum.create :title => "Alabama", :parent_curriculum => parent.id
    Curriculum.create :title => "Alaska", :parent_curriculum => parent.id
    Curriculum.create :title => "Arizona", :parent_curriculum => parent.id
    Curriculum.create :title => "Arkansas", :parent_curriculum => parent.id
    Curriculum.create :title => "California", :parent_curriculum => parent.id
    Curriculum.create :title => "Colorado", :parent_curriculum => parent.id
    Curriculum.create :title => "Connecticut", :parent_curriculum => parent.id
    Curriculum.create :title => "Delaware", :parent_curriculum => parent.id
    Curriculum.create :title => "District Of Columbia", :parent_curriculum => parent.id
    Curriculum.create :title => "Florida", :parent_curriculum => parent.id
    Curriculum.create :title => "Georgia", :parent_curriculum => parent.id
    Curriculum.create :title => "Hawaii", :parent_curriculum => parent.id
    Curriculum.create :title => "Idaho", :parent_curriculum => parent.id
    Curriculum.create :title => "Illinois", :parent_curriculum => parent.id
    Curriculum.create :title => "Indiana", :parent_curriculum => parent.id
    Curriculum.create :title => "Iowa", :parent_curriculum => parent.id
    Curriculum.create :title => "Kansas", :parent_curriculum => parent.id
    Curriculum.create :title => "Kentucky", :parent_curriculum => parent.id
    Curriculum.create :title => "Louisiana", :parent_curriculum => parent.id
    Curriculum.create :title => "Maine", :parent_curriculum => parent.id
    Curriculum.create :title => "Maryland", :parent_curriculum => parent.id
    Curriculum.create :title => "Massachusetts", :parent_curriculum => parent.id
    Curriculum.create :title => "Michigan", :parent_curriculum => parent.id
    Curriculum.create :title => "Minnesota", :parent_curriculum => parent.id
    Curriculum.create :title => "Mississippi", :parent_curriculum => parent.id
    Curriculum.create :title => "Missouri", :parent_curriculum => parent.id
    Curriculum.create :title => "Montana", :parent_curriculum => parent.id
    Curriculum.create :title => "Nebraska", :parent_curriculum => parent.id
    Curriculum.create :title => "Nevada", :parent_curriculum => parent.id
    Curriculum.create :title => "New Hampshire", :parent_curriculum => parent.id
    Curriculum.create :title => "New Jersey", :parent_curriculum => parent.id
    Curriculum.create :title => "New Mexico", :parent_curriculum => parent.id
    Curriculum.create :title => "New York", :parent_curriculum => parent.id
    Curriculum.create :title => "North Carolina", :parent_curriculum => parent.id
    Curriculum.create :title => "North Dakota", :parent_curriculum => parent.id
    Curriculum.create :title => "Ohio", :parent_curriculum => parent.id
    Curriculum.create :title => "Oklahoma", :parent_curriculum => parent.id
    Curriculum.create :title => "Oregon", :parent_curriculum => parent.id
    Curriculum.create :title => "Pennsylvania", :parent_curriculum => parent.id
    Curriculum.create :title => "Rhode Island", :parent_curriculum => parent.id
    Curriculum.create :title => "South Carolina", :parent_curriculum => parent.id
    Curriculum.create :title => "South Dakota", :parent_curriculum => parent.id
    Curriculum.create :title => "Tennessee", :parent_curriculum => parent.id
    Curriculum.create :title => "Texas", :parent_curriculum => parent.id
    Curriculum.create :title => "Utah", :parent_curriculum => parent.id
    Curriculum.create :title => "Vermont", :parent_curriculum => parent.id
    Curriculum.create :title => "Virginia", :parent_curriculum => parent.id
    Curriculum.create :title => "Washington", :parent_curriculum => parent.id
    Curriculum.create :title => "West Virginia", :parent_curriculum => parent.id
    Curriculum.create :title => "Wisconsin", :parent_curriculum => parent.id
    Curriculum.create :title => "Wyoming", :parent_curriculum => parent.id
  end
end
