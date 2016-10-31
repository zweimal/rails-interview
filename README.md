# rails-interview — a sample Ruby on Rails app


## TL;DR

1. Fork the [rails-interview][rails-interview] repository on GitHub
2. Run `bundle install` to install gems
3. Run `bin\rails server`
4. Browse to [http://localhost:3000](http://localhost:3000/students)


## Introduction

This project is a simple [Ruby on Rails](http://rubyonrails.org/) web app for front end developer candidates.

The app doesn't do much, that part is up to the applicant.


## Getting Started

To get you started you can simply fork the [rails-interview][rails-interview] repository, clone it locally, and install the dependencies.

### Prerequisites

You need to have git installed locally so you can clone your fork of the ng-interview repository. You can get git from
[http://git-scm.com/](http://git-scm.com/).

### Fork and Clone ng-interview

Fork the [rails-interview][ng-interview] repository on GitHub.
If you are unfamiliar with forking, [follow these instructions](http://lmgtfy.com/?q=how+to+fork+a+repo+in+github).

Then clone your repository locally using [git][git]:

```
git clone https://github.com/YOUR-USERNAME/rails-interview.git
cd rails-interview
```

*Note: Be sure to replace the URL with the correct URL to your forked repository.*

### Install Dependencies

This project uses bundler for gem management. To retrieve the necessary gems simple run:

```
bundle install
```

### Run the Application

We have preconfigured the project with a simple development web server.  The simplest way to start
this server is:

```
bin\rails server
```

Now browse to the app at `http://localhost:3000/students`.


### Running Integration Tests/End to end

The rails-interview app comes preconfigured with some integration tests. You can run the tests very easily using rake:

```
rake test
```

This will run the tests as defined and report any errors making use of predefined fixtures.
