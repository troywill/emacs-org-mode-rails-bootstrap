<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Introduction</a></li>
<li><a href="#sec-2">2. <code>[0/9]</code> Build an initial Rails application</a></li>
<li><a href="#sec-3">3. <code>[0/4]</code> Incorporate Twitter Bootstrap's CSS style sheets and JavaScript scripts.</a></li>
<li><a href="#sec-4">4. <code>[0/2]</code> Use Twitter Bootstrap fixed width layout in our Rails application</a></li>
</ul>
</div>
</div>
# Introduction

This is a step by step tutorial for new Rails learners to learn how
Twitter Bootstrap works and to how to use Twitter Bootstrap to provide
your application with modern layout and styling. We will build a working
Rails application to match the [starter-template.html](http://twitter.github.io/bootstrap/examples/starter-template.html) template from
[getting-started.html#examples](http://twitter.github.io/bootstrap/getting-started.html#examples).

You can follow the steps below to create a working Rails application.

Note for Emacs users: This tutorial was written in Emacs Org Mode. If
you are an Emacs Org Mode user you can carry out the steps in this tutorial
from the twitter-bootstrap-step-by-step.org file.

# <code>[0/9]</code> Build an initial Rails application

The [Twitter Bootstrap project](http://twitter.github.io/bootstrap/index.html) website provides [8 example layouts](http://twitter.github.io/bootstrap/getting-started.html#examples). In this tutorial we
will use the [starter-template.html](http://twitter.github.io/bootstrap/examples/starter-template.html) template to see how to use Bootstrap's CSS layout.

See [<http://twitter.github.io/bootstrap/>](http://twitter.github.io/bootstrap/) -> [getting-started.html#examples](http://twitter.github.io/bootstrap/getting-started.html#examples) to view all 8 examples.
See [Bootstrap GitHub Repository](https://github.com/twitter/bootstrap) to view the developement repository.

Let's build our example Rails application with a 'home' controller
and 'home/index', "home/about", "home/contact" pages since those pages
are in the [starter-template.html](http://twitter.github.io/bootstrap/examples/starter-template.html) template.

1.  [ ] Initialize a new Rails application
    
        rails new bootstrap

2.  [ ] Change into the newly created Rails application directory
    
        cd bootstrap

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
    
    Note the use of '&#x2013;skip-stylesheets' since we will use Twitter Bootstrap's stylesheets

8.  [ ] Set the default route to home/index in [config/routes.rb](../config/routes.rb)
    
    Open [config/routes.rb](../config/routes.rb)  with your text editor. You will see the following
    two commented lines near the top of the file:
    
        # You can have the root of your site routed with "root"
        # root 'welcome#index'
    
    
    Let's uncomment and change the root:
    
        root 'home#index'
    
    Now, Rails will direct vistors to the application to home/index. We are
    ready to start the Rails application and incorporate Twitter Bootstrap's
    stylesheets and JavaScript scripts.

9.  [ ] Start the rails server
    
        rails server --port 3000

Now, let's incorporate Bootstrap into our application.

# <code>[0/4]</code> Incorporate [Twitter Bootstrap](http://twitter.github.io/bootstrap/)'s CSS style sheets and JavaScript scripts.

The heart of Twitter Bootstrap is two files: [bootstrap.css](https://github.com/twitter/bootstrap/blob/master/docs/assets/css/bootstrap.css) and [bootstrap.js](https://github.com/twitter/bootstrap/blob/master/docs/assets/js/bootstrap.js). We copy
the minified forms of those files ( bootstrap.min.css and bootstrap.min.js ) to our
Rails application structure and Rails will detect and incorporate them into the application.

1.  [ ] Download the Zipfile from Twitter Bootstrap website from your web browser or web client.
    
        # ./bin/fetch-bootstrap-zip.sh
        wget http://twitter.github.io/bootstrap/assets/bootstrap.zip

2.  [ ] Decompress the bootstrap.zip Zip file
    
        unzip bootstrap.zip

3.  [ ] Copy the Bootstrap CSS and Javascript files to our Rails application structure
    
        # ./bin/copy-bootstrap-to-rails.sh
        cp -iv bootstrap/css/bootstrap.min.css ../app/assets/stylesheets
        cp -iv bootstrap/css/bootstrap-responsive.css ../app/assets/stylesheets
        cp -iv bootstrap/js/bootstrap.min.js ../app/assets/javascripts

4.  [ ] Copy glyphicons-halflings.png and glyphicons-halflings-white.png
    
        # ./bin/copy-bootstrap-to-rails.sh
        mkdir -v ../app/assets/images
        cp -iv bootstrap/img/glyphicons-halflings.png ../app/assets/images/
        cp -iv bootstrap/img/glyphicons-halflings-white.png ../app/assets/images/

Now that we have [bootstrap.css](https://github.com/twitter/bootstrap/blob/master/docs/assets/css/bootstrap.css) and [bootstrap.js](https://github.com/twitter/bootstrap/blob/master/docs/assets/js/bootstrap.js) incorporated into our Rails
application we can proceed to change the default Rails application layout
to use Bootstrap's CSS and Javascript.

# <code>[0/2]</code> Use Twitter Bootstrap fixed width layout in our Rails application

Now that Bootstrap is installed let's proceed to use Bootstrap's CSS in our application.

1.  [ ] Overwrite app/views/layouts/application.html.erb with [starter-template.html.erb](app/views/layouts/starter-template.html.erb) 
    
        # ./bin/copy-starter-template.sh
        # this command will replace the default rails layout with a Twitter Bootstrap layout
        cp -v app/views/layouts/starter-template.html.erb ../app/views/layouts/application.html.erb
    
    [starter-template.html.erb](app/views/layouts/starter-template.html.erb) is Twitter Bootstrap's [starter template](https://github.com/twitter/bootstrap/blob/master/docs/examples/starter-template.html) example merged
    with the default [app/views/layouts/application.html.erb](app/views/layouts/application.html.erb) file that Rails generates.
    
    Here's the resulting app/views/layouts/application.html.erb:
    
        <html>
        <head>
          <title>Bootstrap</title>
          <%= stylesheet_link_tag    "application", media: "all", "data-turbolinks-track" => true %>
          <%= javascript_include_tag "application", "data-turbolinks-track" => true %>
          <%= csrf_meta_tags %>
          <style>
            body {
            padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
            }
          </style>  
        </head>
        
            <body>
        
              <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="navbar-inner">
                  <div class="container">
                    <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                    </button>
                    <a class="brand" href="#">Project name</a>
                    <div class="nav-collapse collapse">
                      <ul class="nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#contact">Contact</a></li>
                      </ul>
                    </div><!--/.nav-collapse -->
                  </div>
                </div>
              </div>
              <div class="container">
        
                <h1>Bootstrap starter template</h1>
                <p>Use this document as a way to quick start any new project.<br> All you get is this message and a barebones HTML document.</p>
                <%= yield %>
        
              </div> <!-- /container -->
        
            </body>
        
        
        </body>
        </html>
    
    The starter example layout uses a fixed width layout, which is introduced at [scaffolding.html#layouts](http://twitter.github.io/bootstrap/scaffolding.html#layouts).

2.  [ ] Compare our application at <http://localhost:3000> with <http://twitter.github.io/bootstrap/examples/starter-template.html>.
    
    Our newly created Rails application running on port 3000 should have essentially the
    same appearance as the example running on Twitter's github.io site. It it doesn't something
    went wrong.
