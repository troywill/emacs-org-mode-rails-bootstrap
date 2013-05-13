<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Introduction</a></li>
<li><a href="#sec-2">2. Build an intial Rails application</a></li>
<li><a href="#sec-3">3. Incorporate Twitter Bootstrap's CSS style sheets and JavaScript scripts.</a></li>
<li><a href="#sec-4">4. Use a Twitter Bootstap layout in our application instead of the default Rails layout</a></li>
</ul>
</div>
</div>
# Introduction

This is a step by step tutorial for new Rails learners to learn how
Twitter and Bootstrap works and to how to use Twitter Bootstrap to provide
your application with modern layout and styling. We will build a working
Rails application to match the [starter-template.html](http://twitter.github.io/bootstrap/examples/starter-template.html) template from
[getting-started.html#examples](http://twitter.github.io/bootstrap/getting-started.html#examples).

You can follow the steps below to create a working Rails application.

Note for Emacs users: This tutorial was written in Emacs Org Mode. If
you are an Emacs Org Mode user you can carry out the steps in this tutorial
from the twitter-bootstrap-step-by-step.org file.

# Build an intial Rails application

The [Twitter Bootstrap project](http://twitter.github.io/bootstrap/index.html) website provides [8 example layouts](http://twitter.github.io/bootstrap/getting-started.html#examples). In this tutorial we
will use the [starter-template.html](http://twitter.github.io/bootstrap/examples/starter-template.html) template to see how to use Bootstap's CSS layout.

See [<http://twitter.github.io/bootstrap/>](http://twitter.github.io/bootstrap/) -> [getting-started.html#examples](http://twitter.github.io/bootstrap/getting-started.html#examples) to view all 8 examples.
See [Bootstrap GitHub Repository](https://github.com/twitter/bootstrap) to view the developement repository.

Let's build our example Rails application with a 'home' controller
and 'home/index', "home/about", "home/contact" pages since those pages
are in the [starter-template.html](http://twitter.github.io/bootstrap/examples/starter-template.html) template.

1.  [ ] Initialize a new Rails application
    
        rails new bootstrap_tutorial

2.  [ ] Change into the newly created Rails application directory
    
        cd bootstrap_tutorial

3.  [ ] Clone [this tutorial](https://github.com/troywill/twitter-bootstrap-for-beginners) from Github.
    
        git clone https://github.com/troywill/twitter-bootstrap-for-beginners.git

4.  [ ] Examine your Rails installation
    
        rake about

5.  [ ] Enable a JavaScript runtime in [Gemfile](../Gemfile)
    
    You probably got a 'Could not find a JavaScript runtime.' message from the
    'rake about' command. Open [Gemfile](../Gemfile) with your text editor and enable 'therubyracer.'
    
        # See https://github.com/sstephenson/execjs#readme for more supported runtimes
        gem 'therubyracer', platforms: :ruby
    
    You might open [Gemfile](../Gemfile) with Emacs, Vi, [TextMate](http://macromates.com/), etc. this way:
    
        textmate ../../Gemfile

6.  [ ] Examine your Rails installation again
    
        rake about

7.  [ ] Create a “home” controller and “home/index”, "home/about", "home/contact" pages
    
        rails generate controller home index about contact --skip-stylesheets
    
    Note the use of '&#x2013;skip-stylesheets' since we will use Twitter Bootstap's stylesheets

8.  [ ] Set the default route to home/index in [config/routes.rb](../config/routes.rb)
    
    Open [config/routes.rb](../config/routes.rb)  with your text editor. You will see the following
    two commented lines near the top of the file:
    
        # You can have the root of your site routed with "root"
        # root 'welcome#index'
    
    
    Let's uncomment and change the root:
    
        root 'home#index'
    
    Now, Rails will direct vistors to the application to home/index. We are
    ready to start the Rails application and incorporate Twitter Bootstap's
    stylesheets and JavaScript scripts.

9.  [ ] Start the rails server
    
        rails server --port 3000

# Incorporate [Twitter Bootstrap](http://twitter.github.io/bootstrap/)'s CSS style sheets and JavaScript scripts.

The heart of Twitter Bootstrap is two files: [bootstrap.css](https://github.com/twitter/bootstrap/blob/master/docs/assets/css/bootstrap.css) and [bootstrap.js](https://github.com/twitter/bootstrap/blob/master/docs/assets/js/bootstrap.js). We copy
the minified forms of those files ( bootstrap.min.css and bootstrap.min.js ) to our
Rails application structure and Rails will detect and incorporate them into the application.

1.  [ ] Download the Zipfile from Twitter Bootstap website from your web browser or web client.
    
        wget http://twitter.github.io/bootstrap/assets/bootstrap.zip

2.  [ ] Decompress the bootstrap.zip Zip file
    
        unzip bootstap.zip

3.  [ ] Copy bootstrap.min.css to app/assets/stylesheets
    
        cp -v bootstrap/css/bootstrap.css ../app/assets/stylesheets

4.  [ ] Copy bootstrap-repsonsive.min.css to app/assets/stylesheets
    
        cp -v bootstrap/css/bootstrap-responsive.css ../app/assets/stylesheets

5.  [ ] Copy bootstrap.min.js to app/assets/javascripts
    
        cp -iv bootstrap/js/bootstrap.min.js ../app/assets/javascripts

6.  [ ] Copy two image files
    
        # ‘bootstrap/img/glyphicons-halflings.png’
        # ‘bootstrap/img/glyphicons-halflings-white.png’
        
        mkdir -v ../app/assets/images
        cp -iv bootstrap/img/* ../app/assets/images/

Now that we have [bootstrap.css](https://github.com/twitter/bootstrap/blob/master/docs/assets/css/bootstrap.css) and [bootstrap.js](https://github.com/twitter/bootstrap/blob/master/docs/assets/js/bootstrap.js) incorporated into our Rails
application we can proceed to change the default Rails application layout
the use Bootstap's CSS and Javascript.

# Use a Twitter Bootstap layout in our application instead of the default Rails layout

1.  [X] backup application.html.erb
    
        cp application.html.erb application.html.erb.rails
