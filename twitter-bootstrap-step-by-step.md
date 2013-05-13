<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Introduction</a></li>
<li><a href="#sec-2">2. Part One: Build an Rails application with</a></li>
<li><a href="#sec-3">3. Part Two: Incorporate Twitter Bootstrap's CSS style sheets and JavaScript scripts.</a></li>
</ul>
</div>
</div>
# Introduction

This is a step by step tutorial for new Rails learners to learn how
Twitter and Bootstrap works and to how to use Twitter Bootstrap to provide
your application with modern layout and styling.

You can follow the steps below to create a working Rails application.

Note for Emacs users: This tutorial was written in Emacs Org Mode. If
you are an Emacs Org Mode user you can carry out the steps in this tutorial
from the twitter-bootstrap-step-by-step.org file.

# Part One: Build an Rails application with

The [Twitter Bootstrap project](http://twitter.github.io/bootstrap/index.html) on Github provides [8 example layouts](http://twitter.github.io/bootstrap/getting-started.html#examples). In this tutorial we
will use the [starter-template.html](http://twitter.github.io/bootstrap/examples/starter-template.html) template.

See [<http://twitter.github.io/bootstrap/>](http://twitter.github.io/bootstrap/) -> [getting-started.html#examples](http://twitter.github.io/bootstrap/getting-started.html#examples) to view all 8 examples.

Let's build our example Rails application with a 'home'
controller and 'home/index', "home/about", "home/contact" pages to match the  [starter-template.html](http://twitter.github.io/bootstrap/examples/starter-template.html) template.

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
    
    You might open [Gemfile](../Gemfile) with [TextMate](http://macromates.com/) this way:
    
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

# Part Two: Incorporate [Twitter Bootstrap](http://twitter.github.io/bootstrap/)'s CSS style sheets and JavaScript scripts.
