Rotation
========

Rotation is a simple command line utility to help you rotate any kind of
stuff over time. It was originally created to help control code review
rotation among the members of a team.

Currently it only rotates by any given number of weeks. More units
planned for the future.

Installation
------------

Install the gem:

    gem install rotation

Usage
-----

Create your first rotation topic:

    rotation init topic_name

This will create a `~/.rotation` file. It's a yaml file that will look
like:

    topic_name:
      start_date: 2011-09-12
      duration: 1
      first: Huey
      candidates:
      - Huey
      - Dewey
      - Louie

Tweak the file for your needs. Notice that you can create as many topics
as you want.

See who's in charge by typing:

    rotation responsible topic_name

If you want to check the responsible of each of your topics type:

    rotation responsibles

Author and License
------------------

Marcelo Silveira :: marcelo@mhfs.com.br :: @mhfsilveira

Released under the MIT License. See the [LICENSE][license] file for further
details.

[license]: https://github.com/mhfs/rotation/blob/master/MIT-LICENSE
