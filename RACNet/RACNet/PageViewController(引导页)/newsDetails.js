window.onload = function() {
//    alert(0);
    //拿到所有图片
    var allImg = document.getElementsByTagName("img");
    //alert(allImg.length);
    for(var i=0; i<allImg.length; i++) {
        //单个图片
        var img = allImg[i];
        //监听点击
        img.onclick = function() {
            //alert('点击了第'+i+'张');
            //跳转
            //window.location.href = 'http://www.baidu.com';
            window.location.href = 'wl:///openCamera';
        }
    }
}