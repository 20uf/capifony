# capifony deployment

> Sample scripts capifony


Capistrano: A deployment automation tool built on Ruby, Rake, and SSH.

## Requirements

> capifony

    gem install capifony

> capistrano-ext
    
    gem install capistrano-ext

> capistrano-strategy-copy-with-triggers
    
    gem install capistrano-strategy-copy-with-triggers

## Usage

Validating your Recipe

    cap <stage> deploy:setup

There is a simple way to check the stage

    cap <stage> deploy:check

To deploy your application

    cap <stage> deploy


Find complete documentation on the official website
* http://capifony.org/

## License

Copyright &copy; 2016 [Michael COULLERET aka 20uf](http://github.com/20uf). Licensed under the terms of the [MIT license](LICENSE.md).
