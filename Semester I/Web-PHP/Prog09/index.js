$(document).ready(function() {
    
    $("#slider").slider({
        value: 50,
        min: 0,
        max: 100,
        slide: function(event, ui) {
            $("#slider-value").text(ui.value);
        }
    });

    $("#accordion").accordion({
        heightStyle: "content"
    });
});
