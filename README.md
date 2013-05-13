<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Introduction</a></li>
<li><a href="#sec-2">2. <code>[0/4]</code> Part One: Build a Rails application with Twitter Bootstrap</a></li>
</ul>
</div>
</div>
# Introduction

This is a step by step tutorial for new Rails learners to learn how
Twitter and Bootstrap works and to how to use Twitter Bootstrap to provide
your application with modern layout and styling.

You can follow the steps below to create a working Rails application. This tutorial
was writing in Emacs Org Mode.

# <code>[0/4]</code> Part One: Build a Rails application with [Twitter Bootstrap](http://twitter.github.io/bootstrap/)

1.  [ ] Initialize a new Rails application
    
        rails new bootstrap_tutorial

2.  [ ] Change into the newly created Rails application directory and clone
         [this tutorial](https://github.com/troywill/twitter-bootstrap-for-beginners) from Github.
    
        cd bootstrap_tutorial
        git clone https://github.com/troywill/twitter-bootstrap-for-beginners.git

3.  [ ] Create a “home” controller and “home/index”, "home/about", "home/contact" pages
    
        rails generate controller home index about contact --skip-stylesheets
    
    -   Note the use of \`&#x2013;skip-stylesheets\` since we will use Twitter Bootstap's stylesheets

4.  [ ] Set the default route to home/index in <../config/routes.rb>
    
        root 'home#index'
