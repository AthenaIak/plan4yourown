$(function(){   
        $(".mon.droppable").sortable({
                 connectWith:".mon.droppable",
                 placeholder: "ui-state-highlight"
        }).disableSelection();
        
        $(".tue.droppable").sortable({
                 connectWith:".tue.droppable",
                 placeholder: "ui-state-highlight"
        }).disableSelection();
        
        $(".droppable").on("sortreceive", function(event, ui) {
        var $cell = $(this);

        if ($cell.children().length > 1) {
            $(ui.sender).sortable('cancel');
        }
    });
});