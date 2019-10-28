# README
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     						       THE GOSSIP PROJECT
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Made for Ruby 2.5.1 Rails 5.2.3

           							 PRESENTATION
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The Gossip Project ("TGP") gathers the best gossips ever heard in THP.
This the v1, you'll soon be able to create, edit, comment and like the gossips.


										SET-UP
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

$ git clone https://github.com/philippegatti/28oct

Go to the folder and run $ bundle install

Active the migrations and run the seed :

$ rails db:migrate
$ rails db:seed


										RUNNING
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Launch your server :

$ rails server

(you can also use $ shotgun -p 3000 - but it appears to be slower)


Open a browser and go to

    http://localhost:3000/welcome
    or http://localhost:3000/welcome/your_name for a personalized landing page

Navigate and envoy the Gossips

If you want to contact me, my details are in the contact page.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------