$(function() {
  $( ".draggable" ).draggable({
    appendTo: "body",
    helper: "clone"
  });
  $( ".x" ).droppable({
    activeClass: "ui-state-default",
    hoverClass: "ui-state-hover",
    accept: ":not(.ui-sortable-helper)",
    drop: function( event, ui ) {
      $( this ).text( ui.draggable.text() ).appendTo( this );
      $( this ).addClass( "highlight" )
    }
  }).sortable({
    items: "li:not(.placeholder)",
    sort: function() {
      // gets added unintentionally by droppable interacting with sortable
      // using connectWithSortable fixes this, but doesn't allow you to customize active/hoverClass options
      $( this ).removeClass( "ui-state-default" );
    }
  });
});