function like() {
     
	let Like = `${cv.getCmmntyLike}`;
     
	$.ajax({
    	type: "GET",
    	url: "jsp",
        data: {
       	 	upLike: cmmntyCode,
            cmmnty: "CMMNTY",
        },
        success: function (res) {
            $('#likeBody').html('');
            let htmlStr = '';
                
        	if(res.likeResult) {
                htmlStr += '<i class="lni lni-heart-filled" id="like" />' + totalLike + 'Like';
            }else {
            	htmlStr += '<i class="lni lni-heart" id="like" />' + totalLike + 'Like';
            }
           $('#likeBody').html(htmlStr);
        },
        error: function(err) {
        	console.log(err);
        }
    
    });

}