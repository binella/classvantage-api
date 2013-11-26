#object @user
#node(:name) { |u| u.email }
child(@user => :me) do
  node(:name) { |u| u.email }
  
  node(:access_level) do |u|
    u.admin? ? 2 : 1;
  end
  
end