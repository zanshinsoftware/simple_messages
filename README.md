# Simple Messages

[![Build Status](https://travis-ci.org/29sul/simple_messages.svg?branch=master)](https://travis-ci.org/29sul/simple_messages)
[![Coverage Status](https://coveralls.io/repos/29sul/simple_messages/badge.png?branch=master)](https://coveralls.io/r/29sul/simple_messages?branch=master)
[![Code Climate](https://codeclimate.com/github/29sul/simple_messages/badges/gpa.svg)](https://codeclimate.com/github/29sul/simple_messages)

Gem for displaying flash messages and validation of ActiveRecord.

## Installation

Add this line to your application's Gemfile:

    gem 'simple_messages'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_messages

## Usage

### View helpers

Show messages from flash and ActiveRecord. Options: { flash_messages: true, validation_messages: true, closable: false }

    = simple_messages

Show only messages from flash. Options: { closable: false }

    = simple_messages_flash closable: true

Show only messages from validations of ActiveRecord. Options: { closable: false }

    = simple_messages_validation closable: false

Show messages on remote request.

    js_simple_messages

Show messages in a alert javascript.

    js_simple_messages_alert [ 'This message 1.', 'This message 2.' ]

### Controller helpers

Add product object ActiveRecord

    simple_messages_for_model :product

Skipping product object ActiveRecord

    dont_simple_messages_for_model :product

List objects ActiveRecord

    simple_messages_models

by default is added the controller_name.singular.

