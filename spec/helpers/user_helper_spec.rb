module UserHelperSpec
  def except_create_user user
    user.attributes.except()
  end
end
