// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui
//= require twitter/bootstrap
//= require Chart.bundle
//= require chartkick
//= require_tree .

var stripe = Stripe('pk_test_PsmjlYSEC4yzF9NvZRSxcysV');
var elements = stripe.elements();

function stripe_init_payments(){
  // Custom styling can be passed to options when creating an Element.
  var style = {
    base: {
      // Add your base input styles here. For example:
      fontSize: '16px',
      color: "#32325d",
      borderSize: "1px"
    }
  };

  // Create an instance of the card Element.
  var card = elements.create('card', {style: style});

  // Add an instance of the card Element into the `card-element` <div>.
  card.mount('#card-element');

  card.addEventListener('change', function(event) {
    var displayError = document.getElementById('card-errors');
    if (event.error) {
      displayError.textContent = event.error.message;
    } else {
      displayError.textContent = '';
    }
  });

  // Create a token or display an error when the form is submitted.
  var form = document.getElementById('payment-form');
  form.addEventListener('submit', function(event) {
    event.preventDefault();

    stripe.createToken(card).then(function(result) {
      if (result.error) {
        // Inform the customer that there was an error.
        var errorElement = document.getElementById('card-errors');
        errorElement.textContent = result.error.message;
      } else {
        // Send the token to your server.
        stripeTokenHandler(result.token);
      }
    });
  });

  function stripeTokenHandler(token) {
    // Insert the token ID into the form so it gets submitted to the server
    var form = document.getElementById('payment-form');
    var hiddenInput = document.createElement('input');
    hiddenInput.setAttribute('type', 'hidden');
    hiddenInput.setAttribute('name', 'stripeToken');
    hiddenInput.setAttribute('value', token.id);
    form.appendChild(hiddenInput);

    // Submit the form
    form.submit();
  }
}


function flash_messages(){
  setTimeout(function(){
    jQuery('.alert.fade-out').fadeOut('slow');
  }, 2500);
}

function init_datepicker(){
  jQuery('input.datepicker').each(function(input){
    $(this).datepicker({
      dateFormat: "yy-mm-dd",
      altField: $(this).next()
    })
  });
}

function sort_paginate(){
  $("#church-data th a, #church-data .pagination a").on("click", function(){
    $.getScript(this.href);
    return false;
  });
}

function church_search(){
  $("#church-search").submit(function(){
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });
}

jQuery(document).ready(function(){
  flash_messages();
  init_datepicker();
  sort_paginate();
  church_search();
  stripe_init_payments();
});
