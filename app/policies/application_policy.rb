class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.admin == true
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.admin == true
  end

  def new?
    create?
  end

  def update?
    user.admin == true
  end

  def edit?
    update?
  end

  def destroy?
    user.admin == true
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
