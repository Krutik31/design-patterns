# The query design patterns give us an idea about keeping the query related logic part different from the controller.
# Sometimes we write queries inside controller it self and even some same queries are written multiple times.

# For getting rid of this, query design patterns tells us that we should create another class and keeps the long or reusable queries inside of its methods.

# In below example, we have written query for getting popular posts in different class.
class PopularPostsQuery
  def call(relation)
    relation
      .where(type: :post)
      .where('view_count > ?', 100)
  end
end

# and following is a controller part.
class PostsController < ApplicationController
  def index
    relation = Post.accessible_by(current_ability)
    @popular_posts = PopularPostsQuery.new.call(relation)
  end
end

# Although rails has feature of scoping the queries inside models, this pattern is less used in real life development scenarios.
