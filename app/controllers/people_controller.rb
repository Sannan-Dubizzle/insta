class PeopleController < ApplicationController
  def index
  end

  def show
    @person = Person.find(params[:id])
    @posts = @person.posts
    friends = []

    Friendship.where('person1_id = ? OR person2_id = ?', @person.id, @person.id).each do |friend|
      if friend.person1_id == @person.id
        friends << Person.find(friend.person2_id)
      else
        friends << Person.find(friend.person1_id)
      end
    end

    @friends = friends.uniq  # Remove duplicates if any

  end
end
