# Drupal Headless

Drupal Headless was born to explore the Drupal CMS strengths into a headless scenario, where we still have a bunch of challenges to overcome.

## But be aware!

This repository is part of my development lab, meaning it's completely experimental. From this point, I do not recommend deploying this in real production projects.

Know more: http://rcsilva.tech

## Requirements
  * Docker >= 18.09.0
  * Docker-compose >= 1.13.0
  * Composer >= 1.7.0
  * Node >= 8.10
  * npm => 5.6

## Running

Add the Drupal Headless address to your **/etc/hosts** file

`
127.0.0.1 drupalheadless.localdomain
`

Then, if you are running this project for the first time, run the following command. This will provision the Drupal containers and import the default database dump to the mysql container:

```
make install
```

If you have already run it once, you can simply run:

```
make up
```

There are other commands in the /Makefile, so feel free to explore it.

### Testing

After running **make install** or **make up** A web page will pop up with the React site (http://localhost:3000/). If you want to access the Drupal CMS to manage contents, open the Drupal site address in another tab (http://drupalheadless.localdomain).

The default Drupal admin credentials are:

**User:** admin | **Pass:** admin

## Have fun!