<!doctype html>
<head>
	<title></title>
	<script type="text/javascript" src="/json/js/jquery-2.1.4.js"></script>
</head>
<body>
<input type="button" id="button" value="punch me" onclick="This();">
<br/>
<label id="lbl1"></label><br/>
<label id="lbl2"></label><br/>
<label id="lbl3"></label><br/>
<label id="lbl4"></label><br/>

<script type="text/javascript">

	var myJSONObject = {"ircEvent": "PRIVMSG", "method": "newURI", "regex": "^http://.*"};

    var object;

    //adding value to json object
    for(var i=0;i<20;i++){

       myJSONObject.object = "object"+i;

    }

    //adding value to json array
    var  array =[]
    var object,tmpk,tmpv;
    for(var i=0;i<20;i++){
        array.push("object"+i);

    }

    //adding array to json object
    myJSONObject.array = array;

	function This() {
        $.ajax({

            url: "${createLink(controller: 'Json', action:'data')}",
            data:JSON.stringify(myJSONObject), // JSON.stringify need to use in order to received by server
            dataType: "json", // receiving data type from server
            contentType: "application/json",// sending data type to server
            type: "post",
            success: function (data) {
                var ind =1;

                $.each(data, function(i, item) {
                    console.log(i+" :  "+item);
                    ind++;
                    $("#lbl"+ind).text(i+" :  "+item);
                });
            },
            error: function (data) {
                console.log("error:", data);
            }
        });
    }


</script>
</body>
</html>
