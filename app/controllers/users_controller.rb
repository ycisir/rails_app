class UsersController < ApplicationController

  # completed 
  # form helper
  # url helper 
  # text helper




  # this is method is the action of the above controller  
  def list_users
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    render "show_new_template"
  end


  def show_new_template
    
  end

  def display_other_template

    # overriding default template name
    render 'common_templates/new_template'    
    # render template: 'common_templates/new_template'    
    # render plain: 'calling common_templates/new_template'  
    # render plain: params.inspect

    # render action: :list_users # it directly call template not above action
    # render :list_users # same as above
    
    # render html: ("<h1>rendering html tag</h1>").html_safe

    # redirect_to action: :list_users # it call above action and redirect to that page

    # redirect_to controller: :products, action: :new
  end




  # ===============================================================
  # most used method in irb while inserting new record in table
  # new_record? = return true if ID is saved in db else false
                  # when we create with new it gives true bcz ID not in db 
  # save
  # create = new+save


  # 1st way to create
  # user_new = User.new(first_name: "test", last_name: "test", age: 122)
  # then
  # user_new.new_record? gives true bcz user_new not saved in db
  # user_new.save it return boolean value
  # now new_record? gives false



  # 2nd way to create
  # user_new = User.create(first_name: "test", last_name: "test", age: 122)
  # create method return object










  def new_user
    @user = User.new
    # render "new_user1"
  end

  def create_user
    # render plain: params.inspect
    
    # render plain: params[:user]
    
    @user = User.new(user_params)
    @user.name = @user.fullname
    if @user.save
      redirect_to action: :list_users
    else
      render action: :new_user
    end

  end



  private

  def user_params
    # for new_user1
    # params.require(:user).permit(:first_name, :last_name, :age, :city, :addressline_1, :addressline_2, :zipcode)
    

    # for new_user
    params.require(:user).permit(:first_name, :last_name, :age, :city_id, :gender)
  end


end
