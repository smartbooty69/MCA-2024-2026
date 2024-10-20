$(document).ready(function() {
    
    $("#draggable").draggable();

    $("#droppable").droppable({
        accept: "#draggable",
        drop: function(event, ui) {
            $(this).addClass("ui-widget-header").find("p").remove();
            $(this).html("Dropped!");
            $(this).fadeOut(1000).fadeIn(1000); 
        }
    });
    
    $("#toggle-button").click(function() {
        $("#droppable").toggle("blind", 500); 
    });

    $("#datepicker").datepicker();
});
