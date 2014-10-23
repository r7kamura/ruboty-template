# ruboty-template
A template to create and deploy your [ruboty](https://github.com/r7kamura/ruboty) on slack.

* Your team owner need to enable [XMPP Gateway](https://my.slack.com/admin/settings).
* It's recommended to create a new slack account for your ruboty.

## 1. Deploy
Press "Deploy to Heroku" button and fill in a form to deploy Ruboty to heroku.

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

![](images/deploy.gif)

## 2. Add dyno
Because Heroku doesn't create dyno by default,
you need to add 1 dyno from [dashboard](https://dashboard-next.heroku.com/apps).

![](images/add-dyno.gif)

## 3. Fork
Fork this repository if you want to add other plug-ins. :fork_and_knife:  
See https://github.com/r7kamura/ruboty for more details about ruboty and its plug-ins.
