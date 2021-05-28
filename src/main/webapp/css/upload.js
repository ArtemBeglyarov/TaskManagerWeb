var formData = new FormData();
formData.append("myFile", document.getElementById("myFileField").files[0]);

var xhr = new XMLHttpRequest();
xhr.open("POST", "load.and.save.entity/loadUsers.jsp");
xhr.send(formData);