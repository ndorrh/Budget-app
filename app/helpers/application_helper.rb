module ApplicationHelper
  def group_list
    Group.all
  end

  def devise_mapping
    Devise.mappings[:user]
  end

  def resource_name
    devise_mapping.name
  end

  def resource_class
    devise_mapping.to
  end

  def transaction_total(category)
    category.contracts.reduce(0) { |sum, contract| sum + contract.amount }
  end
end
