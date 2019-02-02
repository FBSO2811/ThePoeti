class PoetryPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def show?
    true  # Anyone can view a poetry
  end

  def create?
    true  # Anyone can create a poetry
  end

  def update?
    true
    # record.user == user  # Only poetry creator can update it
  end

   def destroy?
    record.user == user  # Only poetry creator can update it
  end

end


