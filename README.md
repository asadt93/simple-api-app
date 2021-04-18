# Simple api app
> This is a simple api app


## Version
----------
- ruby 2.5.1
- Rails v5.2.3

## Setup Local
--------------
- Drop db `rails db:drop`
- Create db `rails db:create`
- Migrate Table `rails db:migrate`
- Seed Data `rails db:seed`
- Run local server `rails s`

## Desctiption
----------
- in this API project, I used json_api structure , json api is spesification for building apis in json, by following shared convention , we can increase productivity and focus on what matters.
we can easly include data relationship and specify attributes to what client side needs.
i'm using `fast_json` gem rather than `active model serializer`, based on benchmarking result `fast json` gem perform 25x faster than AMS
and for pagination i prefer to using `pagy` comparing it to the other well known gems like  than `kaminari` or `will_paginate`, pagy preform 40x faster 

-  For solution scale i used to use services patern to running operations in controller but i prefer to using `trailblazer-rails` gem ,as they said that `Trailblazer gives you a high-level architecture for web applications. It extends the basic MVC pattern with new abstractions`, and yeah it makes the code easier to read and simpler, also for scaling and maintenance, but for more complex cases I prefer to create my own service

- For simple authentication i use `knock`gem
