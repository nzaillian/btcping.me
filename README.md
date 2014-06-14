## BTCPing.me

### Simple Bitcoin price alerts

BTCPing.me is a simple Bitcoin price notification app. You can use a fully hosted version of the app at [http://btcping.me](http://btcping.me) for free forever. If you want to host your own, though, I've made the source available in this repo.

##### Example Notification:

![Email Preview](http://i.imgur.com/ZkVjWmr.png)

* * *

##### Setup instructions (local)

-  Run 'bundle install'
-  Set development database credentials in config/database.yml
-  Run 'bundle exec rake db:migrate'
-  Go to config/secrets.yml and set values for the following keys
     * secret_key_base
     * devise_secret (any secure random string just like secret_key_base)
     * mail_intercept_address (address to which you want all emails routed in development)
     * smtp_address (ex. smtp.mymailhost.com, mail.mymailhost.com, send.mymailhost.com etc)
     * smtp_domain (domain for the above)
     * smtp_user_name (ex 'info@mymailhost.com')
     * smtp_password (the password for the above account)
- run 'bundle exec whenever --update-crontab btcpingme'

Note that price lookups and notification email delivery happen within the rake task "send_alerts". If you invoke 'whenever' as indicated above your crontab will be given an entry to run this rake task (on whatever schedule you indicate in config/schedule.rb)

### Images

Below you'll find some images of the app.

![Home](http://i.imgur.com/EH5HZG7.png)
* * *
![All Notifications](http://i.imgur.com/cwcR0UT.png)
* * *
![Notification Edit](http://i.imgur.com/KlG6XE6.png)