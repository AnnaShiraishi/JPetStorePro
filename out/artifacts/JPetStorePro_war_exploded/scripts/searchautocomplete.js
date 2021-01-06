$(function () {
    $('#searchDropDown').hide();

    $('#searchText').bind("input propertychange", function () {
        var data = 'keyword=' + $('#searchText').val();
        console.log(data);
        $.ajax({
            type: "GET",
            dataType: "json",//服务器返回的数据类型
            contentType: "application/json",//post请求的信息格式
            url: "/searchautocomplete" ,
            data: data,
            success: function (data, status) {
                var newContent = '';
                if (!data.isEmpty) {
                    for (var i = 0; i < data.productList.length; ++i) {
                        newContent += '<a class="dropdown-item" href="/search?keyword=';
                        newContent += data.productList[i];
                        newContent += '">';
                        newContent += data.productList[i];
                        newContent += '</a>';
                    }
                    $('#searchDropDown').html(newContent).show();
                } else {
                    $('#searchDropDown').hide();
                }
            },
            error : function() {
                alert("! FAILED !");
            }
        });
    });
});

$(function () {
    $('#searchProductsBtn').on('click', function (e) {
        e.preventDefault();
        var keyword = $('#searchText').val();
        if (keyword == '') {
            $('#searchMsg').text('Please enter the keyword.').hide().fadeIn(1000).fadeOut(1000);
        } else {
            $('#searchForm').submit();
        }
        console.log('hello');
    })
});

