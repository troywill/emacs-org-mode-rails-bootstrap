<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Introduction</a></li>
<li><a href="#sec-2">2. <code>[0/4]</code> Setting up Twitter Bootstrap with the bootstrap-sass Gem</a></li>
<li><a href="#sec-3">3. <code>[0/9]</code> Build an initial Rails application</a></li>
<li><a href="#sec-4">4. <code>[0/2]</code> Use Twitter Bootstrap fixed width layout in our Rails application</a></li>
<li><a href="#sec-5">5. Reference Section</a>
<ul>
<li><a href="#sec-5-1">5.1. Twitter Bootstrap GitHub</a></li>
<li><a href="#sec-5-2">5.2. The most popular Rails Bootstrap Gems</a></li>
</ul>
</li>
</ul>
</div>
</div>
# Introduction

This is a step by step tutorial for new Rails learners to learn how
Twitter Bootstrap works and to how to use Twitter Bootstrap to provide
your application with modern layout and styling. We will build a working
Rails application to match the [starter-template.html](http://twitter.github.io/bootstrap/examples/starter-template.html) template from
[getting-started.html#examples](http://twitter.github.io/bootstrap/getting-started.html#examples).

The [Twitter Bootstrap project](http://twitter.github.io/bootstrap/index.html) website provides [8 example layouts](http://twitter.github.io/bootstrap/getting-started.html#examples). In this tutorial we
will use the [starter-template.html](http://twitter.github.io/bootstrap/examples/starter-template.html) template to see how to use Bootstrap's CSS layout.

See [<http://twitter.github.io/bootstrap/>](http://twitter.github.io/bootstrap/) -> [getting-started.html#examples](http://twitter.github.io/bootstrap/getting-started.html#examples) to view all 8 examples.
See [Bootstrap GitHub Repository](https://github.com/twitter/bootstrap) to view the developement repository.

Note for Emacs users: This tutorial was written in Emacs Org Mode. If
you are an Emacs Org Mode user you can carry out the steps in this tutorial
from the twitter-bootstrap-step-by-step.org file.

# <code>[0/4]</code> Setting up Twitter Bootstrap with the [bootstrap-sass](https://github.com/thomas-mcdonald/bootstrap-sass/blob/master/README.md#bootstrap-for-sass) Gem

1.  [ ] Enable bootstrap-sass in [Gemfile](../Gemfile)
    
        gem 'bootstrap-sass', '~> 2.3.1.0'

2.  [ ] Remove the app/assets/stylesheets/application.css file

3.  [ ] Create a new [app/assets/stylesheets/application.css.scss](../app/assets/stylesheets/application.css.scss) file
    
        @import "bootstrap";
        body { padding-top: 60px; }
        @import "bootstrap-responsive";

4.  [ ] Import bootstrap javascript in [app/assets/javascripts/application.js](../app/assets/javascripts/application.js)
    
        //= require jquery
        //= require jquery_ujs
        //= require turbolinks
        //= require_tree .
        //
        // The following line Loads all Bootstrap javascripts
        // = require bootstrap

# <code>[0/9]</code> Build an initial Rails application

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

# Reference Section

## Twitter Bootstrap GitHub

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col class="left"/>

<col class="left"/>
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Link</th>
<th scope="col" class="left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left"><https://github.com/twitter/bootstrap></td>
<td class="left">The Twitter Bootstrap GitHub repository</td>
</tr>


<tr>
<td class="left">[/docs/examples/starter-template.html](https://github.com/twitter/bootstrap/blob/master/docs/examples/starter-template.html)</td>
<td class="left">Example #1 from Twitter Bootstrap</td>
</tr>


<tr>
<td class="left">[/docs/examples/hero.html](https://github.com/twitter/bootstrap/blob/master/docs/examples/hero.html)</td>
<td class="left">Example #2 from Twitter Bootstrap</td>
</tr>
</tbody>
</table>

## The most popular Rails Bootstrap Gems

<table id="bootstrap_gems" border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col class="left"/>

<col class="right"/>

<col class="left"/>

<col class="left"/>

<col class="left"/>

<col class="left"/>
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Gem</th>
<th scope="col" class="right">Version</th>
<th scope="col" class="left">GitHub</th>
<th scope="col" class="left">Downloads</th>
<th scope="col" class="left">This ver.</th>
<th scope="col" class="left">Author</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">[bootstrap-sass](http://rubygems.org/gems/bootstrap-sass)</td>
<td class="right">2.3.1.0</td>
<td class="left">&#xa0;</td>
<td class="left">1,230,000</td>
<td class="left">110,000</td>
<td class="left">Thomas McDonald</td>
</tr>


<tr>
<td class="left">[twitter-bootstrap-rails](http://rubygems.org/gems/twitter-bootstrap-rails)</td>
<td class="right">2.2.6</td>
<td class="left">&#xa0;</td>
<td class="left">600,000</td>
<td class="left">90,000</td>
<td class="left">Seyhun Akyurek</td>
</tr>


<tr>
<td class="left">[less-rails-bootstrap](http://rubygems.org/gems/less-rails-bootstrap)</td>
<td class="right">2.3.2</td>
<td class="left">&#xa0;</td>
<td class="left">110,000</td>
<td class="left">7,000</td>
<td class="left">Ken Collins</td>
</tr>


<tr>
<td class="left">[sass-twitter-bootstrap](http://rubygems.org/gems/sass-twitter-bootstrap)</td>
<td class="right">2.3.0</td>
<td class="left">&#xa0;</td>
<td class="left">2,000</td>
<td class="left">300</td>
<td class="left">Wade Tandy</td>
</tr>


<tr>
<td class="left">bootstrap-rails</td>
<td class="right">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
<td class="left">&#xa0;</td>
</tr>
</tbody>
</table>
