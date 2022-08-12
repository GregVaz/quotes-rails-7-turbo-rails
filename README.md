# Quotes Rails v7

* Ruby version 3.1.2
* Rails version 7.0.2.4

* Configuration
	* Install and configure you PostgreSQL database 
	* Configure your database credentials in the databsae.yml file

* Database creation
  * Development database -> quote_editor_development
  * Testing database     -> quote_editor_test

* Database initialization
  * Run `bin/setup`
    * If the migrations are not yet created, run `rails db:migrate`
  * Run `rails db:seed`
  * Run `bin/dev`

* How to run the test suite
  * Run `rails test:system`

# Rails 7 Notes

## Turbo Drive

### How does Turbo Drive work?

Turbo Drive works by intercepting "click" events on links and "submit" events on forms.

> Every time a link is clicked, Turbo Drive intercepts the "click" event, overrides the default behavior by transforming the HTML request the link click would normally trigger into an AJAX request. When Turbo Drive receives the response, it replaces the <body> of the current page with the <body> of the response, leaving the <head> unchanged in most cases.

For clicks on links, a pseudo-code implementation would look like this:

```javascript
// Select all links on the page
const links = document.querySelectorAll("a");

// Add a "click" event listener on each link to intercept the click
// and override the default behavior
links.forEach((link) => {
  link.addEventListener("click", (event) => {
    // Override default behavior
    event.preventDefault()
    // Convert the click on the link into an AJAX request
    // Replace the current page's <body> with the <body> of the response
    // and leave the <head> unchanged
  }
)});
```

> The same logic applies to form submissions. When a form is submitted, Turbo Drive intercepts the "submit" event and overrides the default behavior by transforming the form submission into an AJAX request and replacing the <body> of the current page with the <body> of the response, leaving the <head> unchanged.

For form submissions, a pseudo-code implementation would look like this:

```javascript
// Select all forms on the page
const forms = document.querySelectorAll("form");

// Add a "submit" event listener on each form to intercept the submission
// and override the default behavior
forms.forEach((form) => {
  form.addEventListener("submit", (event) => {
  // Override default behavior
    event.preventDefault()
    // Convert the form submission into an AJAX request
    // Replace the current page's <body> with the <body> of the response
    // and leave the <head> unchanged
  }
)});
```

### Disabling Turbo Drive

We may want to disable Turbo Drive for certain link clicks or form submissions in some cases. For example, this can be the case when working with gems that don't support Turbo Drive yet.

At the time writing this chapter, the Devise gem does not support Turbo Drive. A good workaround is to disable Turbo Drive on Devise forms such as the sign-in and sign-up forms.

**To disable Turbo Drive on a link or a form, we need to add the data-turbo="false" data attribute on it.**

For more information check the resource: [Turbo Drive](https://www.hotrails.dev/turbo-rails/turbo-drive)

