#object @user
#node(:name) { |u| u.email }
child(@user => :me) do
  node(:name) { |u| u.email }
end