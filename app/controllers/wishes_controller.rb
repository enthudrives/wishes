class WishesController < ApplicationController
  def index
    @wishes = [
      Wish.new(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pulvinar orci ante. Fusce varius orci at dolor viverra rhoncus vitae at urna. In malesuada, tortor in imperdiet rutrum, turpis ligula dapibus turpis, id faucibus quam nunc ut lectus. Aenean ligula eros, vulputate ut bibendum vulputate, aliquet ut nisl. Nunc feugiat venenatis nulla, nec luctus justo luctus tempor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean consequat sagittis erat, ut euismod velit accumsan eget."),
      Wish.new(content: "Maecenas luctus vulputate ligula, non porttitor turpis dictum ut. Nunc malesuada nisl arcu. Proin bibendum lectus et leo semper laoreet. Aenean consectetur euismod accumsan. Donec eget dignissim nibh. Suspendisse vitae justo lacus. Integer luctus ligula et turpis adipiscing quis fringilla sapien accumsan. Morbi vel malesuada nisi. Vivamus eu sem nec lectus viverra pellentesque nec et lacus. Aliquam vitae elit augue.")
    ]
  end

  def upvote
  end

  def downvote
  end
end
