/**
 * Created by us9159 on 10.06.2014.
 */
$(document).ready(function(){
    Date.prototype.addDays = function(days) {
        this.setDate(this.getDate() + days);
        return this;
    };
    function isValidDate(date)
    {
        var matches = /^(\d{2})[-\/](\d{2})[-\/](\d{4})$/.exec(date);
        if (matches == null) return false;
        var d = matches[2];
        var m = matches[1] - 1;
        var y = matches[3];
        var composedDate = new Date(y, m, d);
        return composedDate.getDate() == d &&
            composedDate.getMonth() == m &&
            composedDate.getFullYear() == y;
    }
    $('.date-in,#type_appeal_id').change(function(){

        //var bigDate = $('.date-out').val().split('.');
        var smallDate = $('.date-in').val().split('.');
      //  bigDate = new Date(bigDate[1]+'.'+bigDate[0]+'.'+bigDate[2]);
        smallDate = new Date(smallDate[1]+'.'+smallDate[0]+'.'+smallDate[2]);
       // $('.response_term').val(+(bigDate-smallDate)/ (1000*60*60*24));
        if($(this).hasClass('date-in') || $(this).attr('id') == 'type_appeal_id'){
            $.ajax({
                url: '/appeals/appeal/getTermToAnswer',
                type: 'POST',
                data: {id: $('#type_appeal_id').val()},
                success: function(data){
                    $('#term_answer').val(data)
                    if($('.date-in').val().length<8) {return false;}
                    var addDate = smallDate.addDays(data);
                    var newDate = new Date(addDate.getMonth()+1 +'.'+ addDate.getDate() +'.'+ addDate.getFullYear());
                    $('#deadline_term').val(((newDate.getDate()<10)?"0"+newDate.getDate():newDate.getDate())+'.'+(((newDate.getMonth()+1)<10)?"0"+(newDate.getMonth()+1):(newDate.getMonth()+1))+'.'+newDate.getFullYear());
                }
            });
        }

    });
    $('#term_answer').keyup(function(){
        if($('.date-in').val().length<8) {return false;}
        var smallDate = $('.date-in').val().split('.');
        var smallDate = new Date(smallDate[1]+'.'+smallDate[0]+'.'+smallDate[2]);
        if(parseInt($(this).val())){
            console.log('parse int true');
            console.log(parseInt($(this).val()));
            var addDate = smallDate.addDays(parseInt($(this).val()));
            var newDate = new Date(addDate.getMonth()+1 +'.'+ addDate.getDate() +'.'+ addDate.getFullYear());
            $('#deadline_term').val(((newDate.getDate()<10)?"0"+newDate.getDate():newDate.getDate())+'.'+(((newDate.getMonth()+1)<10)?"0"+(newDate.getMonth()+1):(newDate.getMonth()+1))+'.'+newDate.getFullYear());
        }else{
            console.log('parse int false');
            $('#deadline_term').val('');
        }
    });
})
