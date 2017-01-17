var ghComment = $("#ghComment");
var ghComment_count = $("ghComment_count");

function formatNumber(val, len) {
    var num = "" + val;
    len = len || 2;
    while (num.length < len) {
        num = "0" + num;
    }
    return num;
}

function formatDate(str) {
    var date = new Date(Date.parse(str));
    return formatNumber(date.getFullYear()) + '-' + formatNumber(date.getMonth() + 1) + '-' + formatNumber(date.getDate()) + 
            " " + formatNumber(date.getHours()) + ":" + formatNumber(date.getMinutes()) + ":" + formatNumber(date.getSeconds());
}

function loadComments(data) {
    console.log("load comments");
    ghComment_count.text(date.length.toString());
    for (var i = 0; i < data.length; i++) {
        var cuser = data[i].user.login;
        var cuserlink = 'https://www.github.com/' + data[i].user.login;
        var cbody = data[i].body_html;
        var cavatarlink = data[i].user.avatar_url;
        var cdate = formatDate(data[i].created_at);
        ghComment.append(
            '<li class="ds-post"><div class="ds-reset"><div class="ds-replybox"><div class="ds_avatar"><a target="_blank" href='
            + cuserlink+' title='+cuser
            +'><img src='+ cavatarlink +'></a></div></div></div>'
            +'<div class="ds-comment-body">'
            +   '<div class="ds-comment-header">'
            +       '<a class="ds-user-name ds-highlight" href='+cuserlink+' target="_blank">'+cuser+'</a>'
            +       '<span class="duoshuo-ua-separator"></span></div>'
            +   '<p>'+cbody+'</p>'
            +   '<div class="ds-comment-footer ds-comment-actions">'
            +       '<span class="ds-time">'+cdate+'</span></div></div></div></li>');
    }
}

$.ajax('https://api.github.com/repos/aak1247/aak1247.github.io/issues/1/comments?per_page=100', {
    headers: {
        Accept: 'application/vnd.github.full+json'
    },
    dataType: 'json',
    success: loadComments
});