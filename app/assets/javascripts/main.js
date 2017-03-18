$(function() {

  function heroHeight() {
    // console.log("Loaded");
    var heroH = $(window).height() - 80;
    $('#hero').height(heroH);
  }

  function customModal() {
    $('#myModal').on('shown.bs.modal', function () {
      $('#applyButton').focus();
    });
  }

  function classActive() {
    $('.navbar-default .navbar-brand:hover, .navbar-default .navbar-brand:hover, .navbar-default .navbar-nav > li > a').each(function() {
      if (this.href == window.location.href) {
        $(this).addClass('active');
      }
    });
  }

  function respond() {
    // Put all responsive functions here
    heroHeight();
  }

  $(document).ready(function() {
    respond();
    customModal();
    classActive();
  });

  $(window).load(function() {
  });

  $(window).resize(function() {
    respond();
  })

}(jQuery));
