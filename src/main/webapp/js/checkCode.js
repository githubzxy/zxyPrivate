     	var code;
     	$.ajax({
     		url:'/admin/login/initVerify.html',
            type:'post',
            dataType:'json',
            contentType: "application/json; charset=utf-8",
            success : function (data) {
            	code = data.code;
            	checkCode.innerHTML = code;
            },
            error:function(){
            	alert("错了");
            }
       })
        function createCode() {
            code = "";
            var checkCode = document.getElementById("checkCode");
            var codeLength = 6; //验证码的长度
            $.ajax({
            	 url:'/admin/login/initVerify.html',
                 type:'post',
                 dataType:'json',
                 contentType: "application/json; charset=utf-8",
               success : function (data) {
            	
            	   code = data.code
            	   checkCode.innerHTML = code;
               }
            	
            })

           /* var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
            'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
            for (var i = 0; i < codeLength; i++)
            {
                var charNum = Math.floor(Math.random() * 52);
                code += codeChars[charNum];
            }
            if (checkCode)
            {
                checkCode.className = "code";
                checkCode.innerHTML = code;
            }*/
        }
        function validateCode()
        {
            var inputCode = document.getElementById("inputCode").value;
            if (inputCode.length <= 0)
            {
                alert("请输入验证码！");
            }
            else if (inputCode.toUpperCase() != code.toUpperCase())
            {
                alert("验证码输入有误！");
                createCode();
            }
            else
            {
                alert("验证码正确！");
            }       
        }   
