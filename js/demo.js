/* Variables */
var AnimEnd = 'animationend webkitAnimationEnd mozAnimationEnd MSAnimationEnd oAnimationEnd';
var nav = $('.nav');
var navButton = $('.nav-el');
var overlay = $('.overlay');

/* On menu button click event */
$(navButton).click(function(event){

    /* This conditional statement is here to prevent
    clicks on inactive buttons on IE10, as pointer-events
    cannot be applied on non-SVG elements */

    if ($(this).hasClass("inactive")) {

        event.preventDefault();

    } else {

        /* Remove old previous classes */
        $(navButton).removeClass('inactive_reverse active_reverse');
        $(nav).removeClass('fx-box_rotate fx-box_rotate_reverse');
        $(overlay).removeClass('active active_reverse');

        /* Add classes on defined elements */
        $(this).siblings().addClass('inactive');
        $(this).addClass('active');
        $(nav).addClass('fx-box_rotate');

        /* Activate related overlay */
        var o_target = $(this).data('id');
        $('#'+o_target).addClass('active');

        /* Prevent scrolling */
        $("body").addClass('noscroll');

    }

});

/* On close button click event */
$(".close").click(function(){

    /* Add *_reverse classes */
    $('.active', nav).removeClass('active').addClass('active_reverse');
    $('.inactive', nav).addClass('inactive_reverse');
    $(nav).addClass('fx-box_rotate_reverse');
    $(this).parent().addClass('active_reverse');

    /* Remove .noscroll and .inactive when animation is finished */
    $('.inactive_reverse').bind(AnimEnd, function(){

        $('body').removeClass('noscroll');
        $(navButton).removeClass('inactive');
        $('.inactive_reverse').unbind(AnimEnd);

    });

});


/*点击修改*/
function checkinfor(){
    $(".introRight").fadeOut(2000);
    $("#changeIn").fadeOut(2000);
    $("#backIn").fadeIn(2000);
    $(".inforCheck").fadeIn(2000);
    $("#chBirth").val($("#birth").text());
    $("#chSex").val($("#sex").text());
    $("#chLike").val($("#like").text());
    $("#chSaying").val($("#saying").text());
}
function backinfor(){
    $("#changeIn").fadeIn(2000);
    $("#backIn").fadeOut(2000);
    $(".introRight").fadeIn(2000);
    $(".inforCheck").fadeOut(2000);
}