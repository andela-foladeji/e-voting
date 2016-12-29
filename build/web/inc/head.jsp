<%-- 
    Document   : head
    Created on : Dec 25, 2016, 6:08:58 PM
    Author     : Oladeji Femi
--%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>E-VOTING</title>
    <link rel="stylesheet" href="css/materialize.min.css"/>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/materialize.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('select').material_select();
            $('.modal').modal();
            var form = $('#create-election');
            form.submit((e) => {
                e.preventDefault();
                var form_status = $('.form_status');
		$.ajax({
                    url: form.attr('action'),
                    data: {election: $("#election").val(), description: $("#description").val(), session: $("#session").val()},
                    method: "POST",
                    beforeSend: function(){
			form_status.html('<div class="progress"><div class="indeterminate"></div></div>').fadeIn();
                    }
		}).done(function(data){
                    const response = JSON.parse(data);
                    if(response.status == 1) {
                        form_status.html('<p class="teal-text text-darken-2">'+response.message+'</p>').delay(2000).fadeOut();
                        setTimeout(() => {
                            location.replace("election.jsp?q="+response.electionId);
                        }, 2000)
                    } else {
                        form_status.html('<p class="red-text text-lighten-1">'+response.message+'</p>').delay(5000).fadeOut();
                    }
                    
		}).error(function(){
                    form_status.html('<p class="red-text text-lighten-1">Please check your internet connection</p>').delay(5000).fadeOut();
		});
            });
            
            $('.add-candidate').click(function() {
                $('.the-post').text($(this).parents('td').siblings('td').eq(1).text());
                $('#postid').attr('value', $(this).attr('id'));
            });
            
            $('#add-candidate').submit((e) => {
                e.preventDefault();
                var form_status = $('.form_status');
		$.ajax({
                    url: $('#add-candidate').attr('action'),
                    data: {
                        candidate: $("#candidate").val(),
                        nickname: $("#nickname").val(),
                        profile: $("#profile").val(),
                        manifesto: $("#manifesto").val(),
                        postid: $('#postid').val()
                    },
                    method: "POST",
                    beforeSend: function(){
			form_status.html('<div class="progress"><div class="indeterminate"></div></div>').fadeIn();
                    }
		}).done(function(data){
                    console.log(data);
                    const response = JSON.parse(data);
                    if(response.status == 1) {
                        form_status.html('<p class="teal-text text-darken-2">'+response.message+'</p>').delay(2000).fadeOut();
                        setTimeout(() => {
                            location.reload();
                        }, 2000)
                    } else {
                        form_status.html('<p class="red-text text-lighten-1">'+response.message+'</p>').delay(5000).fadeOut();
                    }
                    
		}).error(function(){
                    form_status.html('<p class="red-text text-lighten-1">Please check your internet connection</p>').delay(5000).fadeOut();
		});
            })
        });
    </script>
</head>
