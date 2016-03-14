$(document).ready(function(){
    var check  = 1;
    function show(){
        $('#element_to_pop_up').bPopup(
            {
                speed: 450,
                transition: 'slideDown'}
        );
    }
    if(check){
        setTimeout(show, 400)
    }
    $('#expired').click(function(){
        $('#expired_element_to_pop_up').bPopup(
            {
                speed: 450,
                transition: 'slideDown'}
        );
        return false;
    })
})
