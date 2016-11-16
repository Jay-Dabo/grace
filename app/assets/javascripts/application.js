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
//= require turbolinks
//= require_tree .

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
});
