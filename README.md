<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Introduction</a></li>
<li><a href="#sec-2">2. <code>[0/7]</code> Part One: Build a Rails application with Twitter Bootstrap</a></li>
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

# <code>[0/7]</code> Part One: Build a Rails application with [Twitter Bootstrap](http://twitter.github.io/bootstrap/)

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

6.  [ ] Create a “home” controller and “home/index”, "home/about", "home/contact" pages
    
        rails generate controller home index about contact --skip-stylesheets
    
    Note the use of '&#x2013;skip-stylesheets' since we will use Twitter Bootstap's stylesheets

7.  [ ] Set the default route to home/index in [config/routes.rb](../config/routes.rb)
    
        root 'home#index'
