# W6D5
​
## Core Concepts
​
- ERB notation
- render vs redirect
- helper methods and instance variable access
- before_action
​
## Learning Goals
​
### 99 Cats
​
- Be able to build a model with validations and default values
- Know how to build Rails views for new and edit forms
  - Know how to use a hidden field to set the form's method
  - Be able to separate the form out into a partial that both forms use
  - Be able to show data and actions based on the form's type
  - Know how to use `select` and `input` HTML elements
- Be able to add methods to a Rails model
​
## Discussion
​
Today we will do a twist on a debugger waterfall.
​
The files we will walk through are:
1. cats_controller.rb
2. cats/index.html.erb
3. cats/new.html.erb
4. cats/_form.html.erb
​
Place debuggers as follows:
* CatsController#index
* CatsController#new
* CatsController#create
* CatsController#edit
* CatsController#update
* CatsController#cat_params
* cats/index.html.erb
* cats/new.html.erb
* cats/edit.html.erb
* cats/_form.html.erb
​
Make sure your server is running and you have seeded your database.
​
# Walkthrough
​
We will cover:
* Index
* New
* Create
* Show
​
## Index
​
1. Start by typing localhost:3000/cats into your url and ask students where we will go.
  - What in our Rails application determines which controller#action we will hit?
​
2. Continue through the debugger and once we're in CatsController#index. Show off params and what's contained inside.
​
3. Ask which file we'll render onto the page. Continue through the debugger once we have the right answer.
​
4. Follow up with why are we rendering cats/index.html.erb onto the page? What code di we write which caused this behavior?
  - Take note of naming conventions and the file structure inside views.
  - Where dow we get @cats from? Do we have access to any other instance variables from our CatsController?
  - Why do we use differnet erb tags in this file?
​
## New
​
1. We will now create a new cat. Ask students which controller#action will we hit by clicking this button.
  - Again, what in our Rails application determines which controller#action we will hit?
​
2. Continue through the debugger and once we're in CatsController#new. Again, show off params and what's contained inside.
  - Ask if anything will be contained inside cat_params? Note, there is no user submitted data at this point.
​
3. Ask which file we'll render onto the page. Continue through the debugger once we have the right answer.
​
4. Continue to cats/new.html.erb
  - Survey students to see who got up to using form partials. Ask a student who completed form partials to explain the syntax shown. Contiue to our debugger in the form partial.
  - Where do we get @cat from?
​
5.  Highlight the form:action
      - Point out the path helper and no spaces with the quotation marks
        - Emphasize checking rails routes for the help and not guessing!
    - Highlight the form:method
    - Highlight cat and ask where it comes from and why we want it.
      - From the partial as a key-value pair

6. Go over ternary logic shown for the method and path. Run cat.persisted? in the terminal to show results. 
  - Ask students what controller#action should we send this data to once we submit the form
  - Note the difference between the CatsController#new and CatsController#create method. 
    - CatsController#new will render a template for our form. Upon submission of the form, we will send that data to CatsController#create.

​
In addition to that, I would hammer home common errors in the views:
  - Reiterate when you are supposed to use <% %> vs. <%= %>
  - Reiterate how you determine what goes into the action attribute on a form 
  - I would actually show them the error they get when you forget to use <%= url_helper %> in the form action. 
    - It’s not immediately clear what’s going wrong 
  - Also, hammer home the fact that new and edit are what bring us to the form pages. 
    - They are not POST requests, just a GET request to bring us to those pages. 
  - Review how, if we ever forget, we can use rails routes to determine which url helper method, and action, can give us the request we want
​
## Create
​
6. Submit the form with data input from students.
  - Look at params now that the user has submitted data. Note the Permitted false key.
  - Compare this to cat_params and note the Permitted true key.
  - Ask students what is the next part of our application will we hit if we successfully save this cat to the database
    - Note the use of the url helper method
​
7. Before moving on to the CatsController#show and cats/show.html.erb, take any questions studnets may have concerning forms, params, etc.
​
## Show
​
* We may not have time to get to this part.
​
1. Continue through the debugger and once we're in CatsController#show. Show off params and what's contained inside.
​
2. Once we're in our cats/show.html.erb, show of the syntax for tables.
Collapse

