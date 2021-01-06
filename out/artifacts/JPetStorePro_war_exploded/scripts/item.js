$(function () {
    $('.productItem').on('mousemove', function (e) {
        $('#productPreviewCard').css({
            'left': e.pageX + 'px',
            'top': e.pageY +'px'
        });
    }).on('mouseover', function (e) {
        var data= 'id=' + this.getAttribute('productId');
        $.ajax({
            type: "GET",
            dataType: "json",//服务器返回的数据类型
            contentType: "application/json",//post请求的信息格式
            url: "/previewproductdescription" ,
            data: data,
            success: function (data, status) {
                var newContent = '<div class="card" style="width: 18rem; position:absolute;\n' +
                    'left:' + (e.pageX + 10) + 'px;\n' +
                    'top:' + (e.pageY + 10) + 'px;\n' +
                    'z-index:1;">\n' +
                    '<img class="card-img-top" src="/images/' + data.picture + '" alt="product image">\n' +
                    '    <div class="card-body">\n' +
                    '    <h5 class="card-\n' +
                    'title">' + data.name + '</h5>\n' +
                    '<p class="card-text">' + data.description + '</p>\n' +
                    '</div>\n' +
                   '<ul class="list-group list-group-flush">' +
                    '<li class="list-group-item">' + data.categoryId + '</li>'+
                    '<li class="list-group-item">' + data.productId + '</li>'+
                    '</ul>'+
                    '</div>';
                console.log(newContent);
                $('#productPreview').html(newContent);
            },
            error : function() {
                alert("! FAILED !");
            }
        });
    }).on('mouseout', function (e) {
        $('#productPreview').html('');
    });
});


// <div class="card" id="productPreviewCard" style="width: 18rem; position:absolute;
// left:122px;
// top:139px;
// z-index:1;">
// <img class="card-img-top" src="..." alt="Card image cap">
//     <div class="card-body">
//     <h5 class="card-
// title">Card title</h5>
// <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
// <a href="#" class="btn btn-primary">Go somewhere</a>
// </div>
// </div>