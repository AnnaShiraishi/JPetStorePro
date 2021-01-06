$(function () {
    // href="/decrementitem?id=${cartItem.item.itemId}"
    // href="/incrementitem?id=${cartItem.item.itemId}"
    //
    // <button class="btn decrementItemBtn" itemId="${cartItem.item.itemId}">-</button>

    $('.decrementItemBtn').on('click', function (e) {
        var itemId = this.getAttribute('itemId')
        var data = 'id=' + itemId;
        var textId = '#item-' + itemId;
        var quantity = $(textId).val();
        if (quantity > 1) {
            $.ajax({
                type: 'GET',
                dataType: 'json',
                contentType: 'application/json',
                url: '/decrementitem',
                data: data,
                success: function (data) {
                    $(textId).val(quantity - 1);
                    $('#subTotal').html(new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(data.subTotal));
                    $('[itemId=' + itemId + ']').filter('.itemTotal').html(new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(data.itemTotal));
                },
                error: function (e) {
                    alert("failed");
                }
            });
        }
    });

    $('.incrementItemBtn').on('click', function (e) {
        var itemId = this.getAttribute('itemId')
        var data = 'id=' + this.getAttribute('itemId');
        var textId = '#item-' + this.getAttribute('itemId');
        var quantity = $(textId).val();
        $.ajax({
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json',
            url: '/incrementitem',
            data: data,
            success: function (data) {
                $(textId).val(quantity * 1 + 1);
                $('#subTotal').html(new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(data.subTotal));
                $('[itemId=' + itemId + ']').filter('.itemTotal').html(new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(data.itemTotal));
            },
            error: function () {
                alert("failed");
            }
        });
    });

    // $('#cart').hide().fadeIn(500);
    // $('#cartButton').hide().fadeIn(500).on('click', function () {
    //     if (this.class == 'hide') {
    //         $('#smallCart').fadeIn(500);
    //         this.class = 'show';
    //     } else {
    //         $('#smallCart').fadeOut(500);
    //         this.class = 'hide';
    //     }
    // }).prev().hide();
    // $.ajax({
    //     url:"/store/cart",  // 请求的servlet
    //     type:"get",  // 因为没有携带数据，无所谓
    //     async: true,  // 异步
    //     cache: false,  // 不许缓存
    //     success:function(data){  // 请求成功，200
    //         $('#smallCart').html($(data).find('#cart'));
    //     },
    //     error:function(error){  // 请求失败
    //         $('#smallCart').text('error');
    //     }
    // })
});