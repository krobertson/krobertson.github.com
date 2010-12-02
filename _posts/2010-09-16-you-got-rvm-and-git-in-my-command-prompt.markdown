--- 
wordpress_id: 601
layout: post
title: You got RVM and git in my command prompt!
wordpress_url: http://invalidlogic.com/?p=601
---
I had posted this to our internal wiki at work, but <a href="http://twitter.com/scottw">Scott</a> had mentioned he <a href="http://twitter.com/scottw/status/24492462082">was interested in it</a>, so figured I'd throw it up here.

Zsh is the best shell.  If you don't know, <a href="http://www.zsh.org/">now you know</a>.

One thing that is a nice convenience is to setup the command prompt to include your current Ruby implementation, RVM gemset, and which branch of the git repository you are in.  In our main codebase at Involver, my prompt looks like this:

<div align="center"><img src="http://img.skitch.com/20100916-r1s8h53qw3pc718fnb4fnrsefy.jpg" alt="prompt" width="496" height="84" /></div>

From this, I can tell I'm using JRuby 1.5.1, the "involver" gemset.  I'm in the "topsecret" project folder (I just have the current directory, not the full path), and the "git:master" indicates its a git repository and I'm in the master branch.

To achieve that, add the following into your .zshrc or one of the files you source into it.

{% highlight text linenos %}
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\/git:\1/'
}

rvm_prompt() {
  $HOME/.rvm/bin/rvm-prompt v g
}

export PS1='%{$reset_color$fg[blue]%}$(rvm_prompt)%{$reset_color$fg[gray]%}:
%1~%{$reset_color$bold_color$fg[green]%}%{$reset_color$fg[green]%}
$(parse_git_branch)>%{$reset_color%} '
{% endhighlight %}

There are of course many more things you can do with zsh.  I have this and other tidbits in my <a href="http://github.com/krobertson/dotfiles">dotfiles repo</a> on Github.  And now that I think of it, have some stuff I haven't checked in since I'm not in TextMate/Ruby/zsh all day.
