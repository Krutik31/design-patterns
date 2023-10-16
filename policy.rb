# Policy design pattern is used when we have multiple boolean checks on an object inside of a controller.
# We can prevent that multiple checks as below.

# In below example, We have created policies for email and author checks for posts.

class PostPolicy
  def initialize(post)
    @post = post
  end

  private

  attr_reader :post

  def hasEmail?
    post.email?
  end

  def hasAuthor?
    post.author?
  end
end

# below is the code, where we checks the condition.

class PostHandler
  def uploadPost(post)
    policy = PostPolicy.new(post)

    if policy.hasEmail && policy.hasAuthor
    # save to database here
    else
      puts 'error occurred'
    end
  end
end
