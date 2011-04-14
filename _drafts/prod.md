Gemstache is a new service for secure and private rubygem hosting.


Introducing Gemstache

Anyone who has tried to build and distribute their own internal gems has likely run into the issue with the limited ability to host private gems.

Running your own gem repository isn't complicated.  It isn't near as rich an experience as with rolling out public gems, and the gem servers have no concept for authentication, meaning your previous IP is wide open for anyone who knows the right URL.

Gemstache aims to solve these shortcomings.  It allows you to easily and securely distribute your own private gem repositories.  It does this by wrapping rubygems itself to include authentication whenever interacting with your own private repository, forces all connections over SSL, and requiring valid authentication for any and all requests, even to the list of gems.  To help make building the gems easy, you can push out new builds of your gems directly through the command line, or by the web interface.

Access can be granted to users within your team with varying permission levels.