#object @user
#node(:name) { |u| u.email }
child(@user => :me) do
  attributes :name, :email, :school
  
  node(:access_level) do |u|
    u.admin? ? 2 : 1;
  end
  
end