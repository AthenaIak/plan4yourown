$(function () {
    $("#hide").hide();
    $(".mon.droppable").sortable({
        connectWith: ".mon.droppable",
        placeholder: "ui-state-highlight"
    }).disableSelection();

    $(".tue.droppable").sortable({
        connectWith: ".tue.droppable",
        placeholder: "ui-state-highlight"
    }).disableSelection();

    $(".wed.droppable").sortable({
        connectWith: ".wed.droppable",
        placeholder: "ui-state-highlight"
    }).disableSelection();

    $(".thu.droppable").sortable({
        connectWith: ".thu.droppable",
        placeholder: "ui-state-highlight"
    }).disableSelection();

    $(".fri.droppable").sortable({
        connectWith: ".fri.droppable",
        placeholder: "ui-state-highlight"
    }).disableSelection();

    $(".droppable").on("sortreceive", function (event, ui) {
        var $cell = $(this);

        if ($cell.children().length > 1) {
            $(ui.sender).sortable('cancel');
        }
    });

    $("#submit_plan").click(function () {
        $("#hide").show();
    });

    $("#submit_plan").click(function () {
        $("#show").hide();
    });
});