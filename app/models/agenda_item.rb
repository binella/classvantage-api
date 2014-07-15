class AgendaItem < ActiveRecord::Base
  belongs_to :page
  
  default_scope { where("due_date > ?", Time.now()) }

  def hex_code
    if !due_date 
      return "silver"
    end

    daysDiff = (due_date - Date.today).to_i

		if daysDiff < 2
		  return "#ff4626"
		elsif daysDiff < 10 
		  return "#f1af3b"
		else
		  return "#00a573";
    end
    
  end

end
