class GroupUsersController < ApplicationController
    def create
        @group_user = current_user.group_users.new
        @group_user.group_id = params[:group_id]
        @group_user.save
        redirect_to groups_path
    end

    def destroy
        GroupUser.find_by(user_id: params[:user_id], group_id: params[:group_id]).destroy
        redirect_to groups_path
    end
end
