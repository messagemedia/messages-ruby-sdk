# MessageMedia Messages Ruby SDK
[![Travis Build Status](https://api.travis-ci.org/messagemedia/messages-ruby-sdk.svg?branch=master)](https://travis-ci.org/messagemedia/messages-ruby-sdk)

The MessageMedia Messages API provides a number of endpoints for building powerful two-way messaging applications.

![picture](http://i63.tinypic.com/33tox83.jpg)

## Table of Contents
* [Authentication](#authentication)
* [Errors](#errors)
* [Information](#information)
  * [Slack and Mailing List](#mailbox_with_mail-slack-and-mailing-list)
  * [Bug Reports](#bug-bug-reports)
  * [Rate Limits](#rate-limits)
* [Getting Started](#getting-started)
  * [Vanilla Ruby](#vanilla-ruby)
  * [Ruby on Rails](#ruby-on-rails)
* [Supported Ruby Versions](#supported-ruby-versions)

## Authentication

Authentication is done via API keys. Sign up at https://developers.messagemedia.com/register/ to get your API keys.

Requests are authenticated using HTTP Basic Auth or HMAC. Provide your API key as the auth_user_name and API secret as the auth_password.

## Errors

Our API returns standard HTTP success or error status codes. For errors, we will also include extra information about what went wrong encoded in the response as JSON. The most common status codes are listed below. 

#### HTTP Status Codes

| Code      | Title       | Description |
|-----------|-------------|-------------|
| 202 | OK | The request was successful |
| 400 | Bad Request | Bad request |
| 401 | Unauthorized | Your API key is invalid |
| 402 | Disabled feature | Feature cannot be accessed |
| 404 | Not Found |	The resource does not exist |
| 50X | Internal Server Error | An error occurred with our API |

To view the full list visit: https://github.com/messagemedia/messages-ruby-sdk/wiki/HTTP-Status-Codes

## Information

#### :mailbox_with_mail: Slack and Mailing List

If you have any questions, comments, or concerns, please join our Slack channel:
https://developers.messagemedia.com/collaborate/slack/

Alternatively you can email us at:
developers@messagemedia.com

#### :bug: Bug reports

If you discover a problem with the SDK, we would like to know about it. Send an email to:
developers@messagemedia.com

#### :chart_with_upwards_trend: Rate Limits

To protect the stability of the API and keep it available to all users, MessageMedia enforces standard rate limiting. Currently, we have set the quota to 100 SMS per account. We may change these quotas or add new quotas (such as maximum requests per hour) in the future. Requests that hit any of our rate limits will receive a 402 response and you will be notified via email that your quota has been exceeded. If you think you’ll need a higher rate limit, drop us a line at support@messagemedia.com.au


## Getting Started

This documentation will guide on how to get up and running with the SDK on:
* [Vanilla Ruby](#vanilla-ruby)
* [Ruby on Rails](#ruby-on-rails)

## Vanilla Ruby

### 1. Pre-requisites
* [Ruby](https://www.ruby-lang.org/en/downloads/)
* Text Editor (We've provided a list of suggestions)
  * [Atom](https://atom.io/)
  * [Notepad++](https://notepad-plus-plus.org/)
  * [Visual Studio Code](https://code.visualstudio.com/)

### 2. Downloading the SDK
The SDK can be downloaded directly from Github. On the right side of the main page of the master branch, click on the green button that says "Clone or download" and then click on "Download ZIP". Extract this folder to your desktop. Now create a folder on your desktop called "mm_ruby". We will use this in the next step.

![picture](http://i68.tinypic.com/2lvij5s.jpg)

### 3. Getting the neccessary components ready
Inside the extracted folder (messages-ruby-sdk-master), you will find a lot of files that you can explore if you're interested in the structure of the SDK. For now we're going to focus on two certain components. Click on the "lib" folder and inside you will find a file and a folder called "message_media_messages". Copy-paste both of these into the "mm_ruby" folder created earlier. We're halfway through!

![picture](http://i64.tinypic.com/32zq71z.jpg)

### 4. Creating the main file
Open your text editor and copy-paste this chunk of code into it:

```
$LOAD_PATH.unshift('.')
require 'message_media_messages.rb'

auth_user_name = 'API_KEY' 
auth_password = 'API_SECRET'
use_hmac = false # Change this to true if you are using HMAC keys

client = MessageMediaMessages::MessageMediaMessagesClient.new(
    auth_user_name: auth_user_name,
    auth_password: auth_password,
    use_hmac: use_hmac
)

messages = client.messages
body_value = '{
   "messages":[
      {
         "content":"Greeting from MessageMedia!",
         "destination_number":"MOBILE_NUMBER"
      }
   ]
}';

body = JSON.parse(body_value);

result = messages.create_send_messages(body)
```

#### Make sure you update the credentials and the destination number.
Now save it as a ruby file (.rb) inside the "mm_ruby" folder and name the file "messagemedia".
In case you haven't figured it out yet, this is a "starter pack" code for sending a message to a mobile number.
You can add lots of other properties to the body. To find out more visit https://developers.messagemedia.com/code/messages-api-documentation/

### 5. Running the application
* Open your command prompt
* ``` cd ``` into the "mm_ruby" folder
* Run the command ``` ruby messagemedia.rb ```
* Voila!


## Ruby on Rails

### 1. Pre-requisites
* [Ruby](https://www.ruby-lang.org/en/downloads/)
* IDE (We will be using [RubyMine](https://www.jetbrains.com/ruby) for this guide)

### 2. Downloading the SDK
The SDK can be downloaded directly from Github. On the right side of the main page of the master branch, click on the green button that says "Clone or download" and then click on "Download ZIP". Extract this folder to your desktop.

![picture](http://i68.tinypic.com/2lvij5s.jpg)

### 3. Creating a new Rails project

* Open RubyMine
* Click on File -> New project
* On the mini-screen, under Rails, click Application
* The ruby interpreter should be automatically detected in the Ruby SDK option
* Rename your project from "untitled" to "messagemedia_messages"
* Click create

![picture](http://i64.tinypic.com/2gumhyp.png)

You will see the following displayed in the terminal after a successful installation

![picture](http://i67.tinypic.com/2e208li.png)

### 4. Referencing the MessageMedia gem

* Open the Gemfile
* Add the following line ``` gem 'messagemedia_messages_sdk', '~> 1.0' ```
* Save the file
* On the navigation bar, Click on View -> Tool Windows -> Terminal
* Run the following command ``` bundle install ``` to install the SDK

![picture](http://i66.tinypic.com/t8ubrs.png)

### 5. Adding additional dependency files

* Open the lib folder and create a new directory/folder called "mm"
* Now open the SDK folder (messages-ruby-sdk) you downloaded earlier in Step 2
* Click on lib and copy-paste the file and folder (message_media_messages) to the "mm" folder in your Rails application

![picture](http://i68.tinypic.com/f20epu.jpg)
* Click on config -> application.rb
* Under ``` config.load_defaults ``` add the following line ``` config.autoload_paths << Rails.root.join('lib/mm') ```

![picture](http://i68.tinypic.com/16hj42c.jpg)
In case you were wondering, this line basically loads the dependency files for our Rails application

### 6. Adding a controller

* In the terminal, run the following command ``` rails g controller Home index ```
* This will create a controller with the name "Home" with an action/method called "index"
* Open the generated controller which can be found under app -> controller -> home_controller.rb
* Inside the index action, paste this chunk of code:

```
# Configuration parameters and credentials
auth_user_name = 'API_KEY' 
auth_password = 'API_SECRET'
use_hmac = false # Change this to true if you are using HMAC keys

client = MessageMediaMessages::MessageMediaMessagesClient.new(
    auth_user_name: auth_user_name,
    auth_password: auth_password,
    use_hmac: use_hmac
)

messages = client.messages
body_value = '{
   "messages":[
      {
         "content":"My first message",
         "destination_number":"YOUR_MOBILE_NUMBER"
      }
   ]
}';

body = JSON.parse(body_value);

result = messages.create_send_messages(body)
```

#### Make sure you update the credentials and the destination number.

### 7. Running the application

* Click on Run -> Run -> Development: messagemedia_messages
* You will see the following displayed in the console after the application starts running

![picture](http://i68.tinypic.com/213qeqv.jpg)
* Once you see that, open your browser and type in http://localhost:3000/ and press Enter
* You should see a heading that says "Home#index" and within a few seconds your message should be delivered to the destination number

## Supported Ruby Versions

This library supports and is [tested against](https://travis-ci.org/messagemedia/messages-ruby-sdk) the following Ruby implementations:

* Ruby 2.4.0
* Ruby 2.3.0
* Ruby 2.2.0
* Ruby 2.1.0
* Ruby 2.0.0
