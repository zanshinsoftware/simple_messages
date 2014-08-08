# Simple Messages

[![Build Status](https://travis-ci.org/29sul/simple_messages.svg?branch=master)](https://travis-ci.org/29sul/simple_messages)
[![Code Climate](https://codeclimate.com/github/29sul/simple_messages/badges/gpa.svg)](https://codeclimate.com/github/29sul/simple_messages)

Gem for show the ActiveModel Validations and Flash messages.

## Installation

Add this line to your application's Gemfile:

    gem 'simple_messages'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_messages

## Usage

Simply call localized on your models:

    class Product < ActiveRecord::Base
      localized
    end

By default, all the columns of type decimal, float, date, time will be located.

    product = Product.new(quantity: 7, unit_amount: 1_123.25, issued_at: Date.new(2014, 2, 13) )
    product.issued_at # Thu, 13 Feb 2014
    product.issued_at_localized # 2014-2-13
    product.unit_amount # 1123.25
    product.unit_amount_localized # 1,123.25

### Specifying other attributes

You can, however, inform other attributes or methods you want to localize.

    class Product < ActiveRecord::Base
      localize methods: { total: :decimal }

      def total
        quantity * unit_amount
      end
    end

### Custom parser

You can create your modules themselves.

    module CustomParser
      def parse(value)

      end

      def localize(value)

      end
    end

    class Product < ActiveRecord::Base
      localize methods: { total: CustomParser }

      def total
        quantity * unit_amount
      end
    end

## Add more formats supported

By default, the date and time is used the default format defined in the translation file.

    en:
      date:
        formats:
          localized:
          - '%d/%m/%Y'
          - '%d-%m-%Y'
          - '%d/%m/%y'
          - '%d-%m-%y'
          - '%d/%m'
          - '%d-%m'

      time:
        formats:
          localized:
          - '%d-%m-%Y %H:%M'
          - '%H:%M:%S'
          - '%H:%M'
