# This is EasyWay

### Project description

System is represented as a resource manager.
The objectives of system are planning of education and planning of using resource.
It is posible to configure site usage by itself.
For example, you can create a bookmark frequently visited pages.

### Possibilities in our system

* you can register
* you can use the resources that are the essence of reality. For example students, teachers and audience
* сreate an event and sub-event, using the right resources
* create a bookmark frequently visited pages
* make notification of an event
* display events in tables

### More about each part of project

* [Events](https://github.com/SS-IT-Academy/EasyWay/wiki/About-Event)
* [Resources](https://github.com/SS-IT-Academy/EasyWay/wiki/Resources)
* [Notifications](https://github.com/SS-IT-Academy/EasyWay/wiki/Notifications)

### Ruby on Rails

This application requires:

* Ruby version 2.1.0
* Rails version 3.2.13

### Database

This application uses Sqlite3 with ActiveRecord.
To see database diagram and relations, you must download ArgoUml and open this file `EasyWay-DB_full_diagram.argo`


### Development

* Testing gem: [RSpec](https://github.com/rspec/rspec-core), [Shoulda](https://github.com/thoughtbot/shoulda), [Factory Girl](https://github.com/thoughtbot/factory_girl)
* UI framefork: [Twitter Bootstrap](https://github.com/seyhunak/twitter-bootstrap-rails)
* Authentication: [Devise](https://github.com/plataformatec/devise), [Devise invitable](https://github.com/scambra/devise_invitable)
* Authorization: [CanCan](https://github.com/ryanb/cancan)
* Frontend framework: [Backbone](https://github.com/codebrew/backbone-rails), Underscore
* Other gem: [IceCube](https://github.com/seejohnrun/ice_cube), [Recurring-select](https://github.com/GetJobber/recurring_select)

### Getting Started

1. clone project `git clone https://github.com/SS-IT-Academy/EasyWay`
2. run bundle `bundle install`
3. rake db `rake db:migrate`
4. srart server `rails s`

