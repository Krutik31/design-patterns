# Presenter patterns is used when we want to reduce the number of multiple conditional checks in view part of rails app.
# By following this way, we will create presenter class that handles all the conditional checks for us an view files looks undestandable.


# In below code, we can see that this view file looks messy due to multiple conditional checks.

<% #/app/views/posts/view.html.erb %>
<% content_for :header do %>
 <title>
     <%= @post.title %>
 </title>
 <meta name='description' content="<%= @post.description_for_head %>">
  <meta property="og:type" content="post">
  <meta property="og:title" content="<%= @post.title %>">
  <% if @post.description_for_head %>
    <meta property="og:description" content="<%= @post.description_for_head %>">
  <% end %>
  <% if @post.image %>
     <meta property="og:image" content="<%= "#{request.protocol}#{request.host_with_port}#{@post.image}" %>">
  <% end %>
<% end %>

<% if @post.image %>
 <%= image_tag @post.image.url %>
<% else %>
 <%= image_tag 'no-image.png'%>
<% end %>

<h1>  <%= @post.title %> </h1>
<p>  <%= @post.content %> </p>

<% if @post.author %>
<p>  <%= "#{@post.author.first_name} #{@post.author.last_name}" %> </p>
<%end%>

<p>
 <%= t('date') %>
 <%= @post.timestamp.strftime("%B %e, %Y")%>
</p>

# Now we refactor above code using presenter design pattern.

class PostPresenter
  def initialize(post)
    @post = post
  end

  def image
    @post.image? ? @post.image.url : 'no-image.png'
  end
  
  # similary define other methods with their logic

end

<%# /app/views/posts/view.html.erb %>
<% presenter @post do |post_presenter| %>
 <% content_for :header do %>
   <%= post_presenter.meta_title %>
   <%= post_presenter.meta_description %>
   <%= post_presenter.og_type %>
   <%= post_presenter.og_title %>
   <%= post_presenter.og_description %>
   <%= post_presenter.og_image %>
 <% end %>
 <%= post_presenter.image%>
 <h1> <%= post_presenter.title %> </h1>
 <p>  <%= post_presenter.content %> </p>
 <%= post_presenter.author_name %>
 <p> <%= post_presenter.timestamp %></p>
<% end %>