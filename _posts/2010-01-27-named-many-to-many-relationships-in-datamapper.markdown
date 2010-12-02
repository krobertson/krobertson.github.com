--- 
wordpress_id: 440
layout: post
title: Named many-to-many relationships in DataMapper
wordpress_url: http://invalidlogic.com/?p=440
---
When implementing the collaborators feature in <a href="http://trunksapp.com/">Trunks</a>, ran into a bit of a roadblock with how to describe the relationships between the repository and the users.

Trunks is built on <a href="http://merbivore.org/">Merb</a> and <a href="http://datamapper.org/">DataMapper</a>, and the implementation involved two models: a User and a Project.  In Trunks, a repository is a Project because "repository" is a reserved attribute in DataMapper and I was running into issues early on, so I changed it to Project.

A project belongs to a user, and a user has many projects.  A user can also be a collaborator on many projects, and a project can have many collaborators.  So I already had the first relationship which was a simple 1-to-many relationship.  The problem came about with adding collaborators.  In a sense, it is a normal many-to-many, which you can do in DataMapper similar to how you would in ActiveRecord using a "has_many ..., :through =&gt; ..." relationship, but I was creating a relationship between models that had an existing and separate relationship.

I didn't want the user.projects collection to return the projects a user collaborated on, because it was intended to only be the user's own projects.  And similarly, a project only has one owner, not many.

I essentially found I needed a "has many through" with named attributes.  To do this, I had to actually create the proxy class that goes between the user and the project model, rather than let DataMapper create it automatically.  That way, I can control the attribute names on the proxy class so that "users" and "projects" on the two models won't get munged.

The result looked like this:

{% highlight ruby linenos %}
class User
  include DataMapper::Resource
  ...
  has n, :collaborations
  has n, :collab_projects, :model => 'Project', :child_key => [:id], :parent_key => [:user_id], :through => :collaborations
end

class Project
  include DataMapper::Resource
  ...
  has n, :collaborations
  has n, :collab_users, :model => 'User', :child_key => [:id], :parent_key => [:project_id], :through => :collaborations
end

class Collaboration
  include DataMapper::Resource

  property :id, Serial

  belongs_to :collab_user, :model => 'User', :child_key => [:user_id]
  belongs_to :collab_project, :model => 'Project', :child_key => [:project_id]
end
{% endhighlight %}

Having a "collab_users" on the Collaboration class allowed me to have the project model to get an attribute name "collab_users" instead of trying to use "users".  And on user, I could have "collab_projects" instead of mixing things up with the existing "projects" attribute.

When creating the relationships though, I had to be careful to spell out the actual parent and child fields rather than let them be automatic, otherwise it'll run into issues where it'll try to create 'collab_user_id' and 'collab_project_id' and inserts will fail because those columns aren't being set.

Take the relationship definition on the user model:

{% highlight ruby %}
has n, :collab_projects, :model => 'Project', :child_key => [:id], :parent_key => [:user_id], :through => :collaborations
{% endhighlight %}

I am essentially saying create an attribute named 'collab_projects' through the 'collaborations' relationship.  'collab_projects' will be of type Project.  The child key on Collaboration is 'user_id' and the primary key on User is 'id'.  Here, the fields I specify are betwen User and Collaboration, not on Project.

Then on Collaboration, I have:

{% highlight ruby %}
belongs_to :collab_user, :model => 'User', :child_key => [:user_id]
{% endhighlight %}

Here I tell it that the attribute on Collaboration will be collab_user, but the model it is linking to is User.  Basically saying I belong to user, but don't create an attribute named 'user'.  I set the child key, which is the column on Collaboration, to be 'user_id'.  I want to do that else it will try to create it as 'collab_user_id'.

Confused enough?  All boils down to having two separate relationships between two models and having control over what the attributes are named.  After all this, I end up with these calls:

{% highlight ruby %}
  user.projects        # the user's own projects
  user.collab_projects # the projects the user is a collaborator on

  project.user         # the owner of the project
  project.collab_users # the users who are collaborators on the project
{% endhighlight %}