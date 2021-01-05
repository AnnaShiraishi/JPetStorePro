$(function () {
    $('#cart').hide().fadeIn(500);
    $('#cartButton').hide().fadeIn(500).on('click', function () {
        if (this.class == 'hide') {
            $('#smallCart').fadeIn(500);
            this.class = 'show';
        } else {
            $('#smallCart').fadeOut(500);
            this.class = 'hide';
        }
    }).prev().hide();
    $.ajax({
        url:"/store/cart",  // 请求的servlet
        type:"get",  // 因为没有携带数据，无所谓
        async: true,  // 异步
        cache: false,  // 不许缓存
        success:function(data){  // 请求成功，200
            $('#smallCart').html($(data).find('#cart'));
        },
        error:function(error){  // 请求失败
            $('#smallCart').text('error');
        }
    })
});