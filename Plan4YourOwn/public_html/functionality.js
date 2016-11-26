$(function(){   
        $(".mon.droppable").sortable({
                 connectWith:".mon.droppable",
                 placeholder: "ui-state-highlight"
        }).disableSelection();
        
        $(".tue.droppable").sortable({
                 connectWith:".tue.droppable",
                 placeholder: "ui-state-highlight"
        }).disableSelection();
});