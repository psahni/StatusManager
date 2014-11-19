/*Onload:Dashboard*/
jQuery(function($){

    $.Claim({items: ['Track your team status and activity in efficient manner',
        'Generate & Download Status reports',
        'Get notified when team member updates status']
    });

    $('[data-toggle="tooltip"]').tooltip({
        template: '<div class="tooltip status-tootip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',
        title: function(){
            return statusHtml($(this).data("status"));
        }
    });

});