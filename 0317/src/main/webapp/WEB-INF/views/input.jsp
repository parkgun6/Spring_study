<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr/>
<button id="saveBtn">Register</button>
<hr/>
<hr/>
<input type='file' name='uploadFile' onchange="preview()" multiple='multiple'>

<!-- <button id='uploadBtn'>Upload</button> -->


<ul class="uploadResult">
	
</ul>

<script>
document.querySelector("#saveBtn")
.addEventListener("click", function(e){
	


  const obj  = {
		  title:"Title", 
		  content:"Content",
		  writer:"user00",
		  fileList: arr}	
	
  fetch("/board/register",
		  {
	  		method: 'post',
	  		headers: {'Content-type': 'application/json; charset=UTF-8'},
	  		body: JSON.stringify(obj)
		  })

}, false);

const uploadUL = document.querySelector(".uploadResult");

const arr = [];

const uploadFile = document.querySelector("input[name='uploadFile']");

const outerHTML = uploadFile.outerHTML;


function preview(){
	//alert('aaa');
	const formData = new FormData();
	const input = document.querySelector("input[name=uploadFile]");

	//jquery라면 input[0].files; 가 된다.
	const files = input.files;
	
	//log를찍으면 element만 나오고 안에 올라간파일을 알 수 없다.
	console.dir(input);
	
	for (var i = 0; i < files.length; i++) {
		//controller에 있는 파라미터명과 맞춰주어야한다.
		formData.append("files",files[i]);
	}
	
	fetch("http://192.168.0.101:8080/upload", {
		method:"post",
		body:formData
	}).then(res => res.json())
	.then(jsonObj => {
		console.log(jsonObj);
		
		let htmlCode = "";
		for (let i = 0; i < jsonObj.length; i++) {
			
			//변수를 선언해주는것이 좋다.
			let fileObj = jsonObj[i];
			arr.push(fileObj)
			//돔은 한번만 만들어서 한번에 append해주는게 성능상 좋다.
			//remove(remove(JSON.stringify))를 해줘야지만 동작한다.
			htmlCode +="<li id='li_"+fileObj.uuid+"'><img src='/view?file="+fileObj.link+"'>"+
			"<span>"+fileObj.fileName+"</span><button onclick='removeFile("+JSON.stringify(fileObj)+")'>DEL</button></li>";
		}
		
		//+= 가 아닌 =면 기존의것이 초기화된상태로 추가된다.
		uploadUL.innerHTML += htmlCode;
		
		//cloneUploadFile 삭제 
		//uploadFile.remove();
		
		//console.log(cloneUploadFile);
		
		document.querySelector("input[name=uploadFile]").remove();
		
		
		document.querySelector("body").insertAdjacentHTML('afterbegin',outerHTML);
		console.dir(document.querySelector("input[name=uploadFile]"));
		//input = cloneUploadFile;
		//console.log(input.value);
		
		//readonly이기 때문에 value=""는 하지않는게 좋다.
		//input.value="";
		//console.log(input.value);
		//console.dir(input.innerHTML );
	})
}


/* -----------------------------li 삭제 함수------------------------------ */


function removeFile(param){
	console.log(param);
	//alert("remove file");
	
	fetch("/removeFile",
			{
			method: 'delete',
			headers: {'Content-Type':'application/json'},
			body: JSON.stringify(param)
			})
	
	document.querySelector("#li_"+param.uuid).remove();
}

/* ------------------------------업로드 이벤트----------------------------- */
/* document.querySelector("#uploadBtn").addEventListener("click",function(e){
	
	const formData = new FormData();
	const input = document.querySelector("input[name=uploadFile]");

	//jquery라면 input[0].files; 가 된다.
	const files = input.files;
	
	//log를찍으면 element만 나오고 안에 올라간파일을 알 수 없다.
	console.dir(input);
	
	for (var i = 0; i < files.length; i++) {
		//controller에 있는 파라미터명과 맞춰주어야한다.
		formData.append("files",files[i]);
	}
	
	fetch("http://192.168.0.101:8080/upload", {
		method:"post",
		body:formData
	}).then(res => res.json())
	.then(jsonObj => {
		console.log(jsonObj);
		
		let htmlCode = "";
		for (let i = 0; i < jsonObj.length; i++) {
			
			fileObj = jsonObj[i];
			//돔은 한번만 만들어서 한번에 append해주는게 성능상 좋다.
			htmlCode +="<li><img src='/view?file="+fileObj.link+"'></li>";
		}
		
		//+= 가 아닌 =면 기존의것이 초기화된상태로 추가된다.
		uploadUL.innerHTML += htmlCode;
		
		//cloneUploadFile 삭제 
		//cloneUploadFile.remove();
		
		//console.log(cloneUploadFile);
		
		document.querySelector("input[name=uploadFile]").remove();
		
		
		document.querySelector("body").insertAdjacentHTML('afterbegin',outerHTML);
		
		//input = cloneUploadFile;
		//console.log(input.value);
		
		//readonly이기 때문에 value=""는 하지않는게 좋다.
		//input.value="";
		//console.log(input.value);
		//console.dir(input.innerHTML );
	})
	
	
},false); */

</script>

</body>
</html>