class PostDepartmentAbstract
  def self.next_postman(postman); end

  def self.delivery(supply); end 
end

class PostDepartmentBasic < PostDepartmentAbstract
  def self.delivery(supply)
    delivered = [true, false].sample
    if delivered
      "delivered to #{self}"
    else
      next_department(supply)
    end
  end
end   

class PostDepartment1 < PostDepartmentBasic
  def self.next_department(supply)
    PostDepartment2.delivery(supply)
  end
end

class PostDepartment2 < PostDepartmentBasic
  def self.next_department(supply)
    PostDepartment3.delivery(supply)
  end
end

class PostDepartment3 < PostDepartmentBasic
  def self.next_department(supply)
    PostDepartment3.delivery(supply)
  end
end

class Supply
  def initialize(name)
    @name = name
    @current_departmant = nil
  end
  
  def name
    @name
  end
end

supply = Supply.new('this')
PostDepartment1.delivery('this')
