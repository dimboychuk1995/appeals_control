/**
 * Created by us9159 on 29.05.2014.
 */
function confirmDelete(){
    if(confirm('Ви впевнені?')){
        return true;
    }else{
        return false;
    }
}
$(document).ready(function(){
    $('.tabs li').click(function(){
        var link = "."+$(this).attr('link');
        $('.tabs li').removeClass('current-tabs');
        $(this).addClass('current-tabs');
        console.log(link);
        $('.for-tabs').hide();
        $(link).show();
    });
    Date.prototype.addDays = function(days) {
        this.setDate(this.getDate() + days);
        return this;
    };
    $('.date-out,.date-in,#type_appeal_id').change(function(){
        var bigDate = $('.date-out').val().split('.');
        var smallDate = $('.date-in').val().split('.');
        bigDate = new Date(bigDate[1]+'.'+bigDate[0]+'.'+bigDate[2]);
        smallDate = new Date(smallDate[1]+'.'+smallDate[0]+'.'+smallDate[2]);
        if($('.date-out').val().length>8){$('.response_term').val(parseInt((bigDate-smallDate)/(1000*60*60*24)));}

        if($(this).hasClass('date-in') || $(this).attr('id') == 'type_appeal_id'){
            $.ajax({
                url: '/appeals/appeal/getTermToAnswer',
                type: 'POST',
                data: {id: $('#type_appeal_id').val()},
                success: function(data){
                    var addDate = smallDate.addDays(data);
                    var newDate = new Date(addDate.getMonth()+1 +'.'+ addDate.getDate() +'.'+ addDate.getFullYear());
                    $('#deadline_term').val(((newDate.getDate()<10)?"0"+newDate.getDate():newDate.getDate())+'.'+(((newDate.getMonth()+1)<10)?"0"+(newDate.getMonth()+1):(newDate.getMonth()+1))+'.'+newDate.getFullYear());
                    $('#term_answer').val(data)
                }
            });
        }

    });
    function validateEmail(email) {
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        if( !emailReg.test(email) ) {
            return false;
        }
        else {
            return true;
        }
    }
    $('#term_answer').keyup(function(){
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
    if($('.insertDate').val()){
        $('.checkbox-reminder').attr( "onclick", "return false" )
    }else{
        $('.checkbox-reminder').change(function(){
            console.log('change checkbox');
            if($('.insertDate').val()){
                $('.insertDate').val('');
            }else{
                $('.insertDate').val($.datepicker.formatDate('dd.mm.yy', new Date()));
            }

        })
    }
    if($('.synergyDate').val()){
        $('.synergyCheckbox').attr( "onclick", "return false" )
    }else{
        $('.synergyCheckbox').change(function(){
            console.log('change checkbox');
            if($('.synergyDate').val()){
                $('.synergyDate').val('');
            }else{
                $('.synergyDate').val($.datepicker.formatDate('dd.mm.yy', new Date()));
            }

        })
    }
    $('#sendEmail').click(function(){
        if(!$('input[name="email"]').val() || !validateEmail($('input[name="email"]').val()) ){
            $('input[name="email"]').css({border:"solid 1px red"});
           // alert('Введіть email!!');
            return;
        }
        $('input[name="email"]').css({border:"solid 1px #ccc"});
        var appeal = {
            "out_date": $.datepicker.parseDate("dd.mm.yy", $('input[name="out_date"]').val()),
            "executor":$('input[name="executor"]').val(),
            "in_number":$('input[name="in_number"]').val(),
            "in_date": $.datepicker.parseDate("dd.mm.yy", $('input[name="in_date"]').val()),
            "text_appeal":$('input[name="text_appeal"]').val(),
            "customer":$('input[name="customer"]').val(),
            "deadline_term":$.datepicker.parseDate("dd.mm.yy",$('input[name="deadline_term"]').val()),
            "email":$('input[name="email"]').val()
        };
        $.ajax({
            url: '/appeals/appeal/sendEmail',
            type: 'POST',
            contentType : 'application/json; charset=utf-8',
           // dataType : 'json',
            data: JSON.stringify(appeal),
            success: function(data){
                alert('Відправлено успішно!');
                $('input[name="reminder_email"]').val(data);
                $('input[name="email_check"]').prop("checked", true);

            },
            error: function (request, status, error) {
                alert(error);
            }
        });
    });
});