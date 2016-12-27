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
            
            var form = $('#create-election');
            form.submit((e) => {
                e.preventDefault();
                var form_status = $('<div class="form_status"></div>');
		$.ajax({
                    url: form.attr('action'),
                    data: {election: $("#election").val(), description: $("#description").val(), session: $("#session").val()},
                    method: "POST",
                    beforeSend: function(){
			form_status.html('<div class="progress"><div class="indeterminate"></div></div>').fadeIn();
                    }
		}).done(function(data){
                    console.log(data);
                    form_status.html('<p class="text-success">Election Successfully created</p>').delay(5000).fadeOut();
		}).error(function(){
                    form_status.html('<p class="text-error">Please check your internet connection</p>').delay(5000).fadeOut();
		});
            })
        });
    </script>
</head>
