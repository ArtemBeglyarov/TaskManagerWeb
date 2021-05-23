function getCheckedCheckBox(){
    var array = [];
    var checkboxes = document.querySelectorAll('input[type=checkbox][name=lfcheckboxes]:checked');
    for (var i = 0; i < checkboxes.length; i++) {
        array.push(Number(checkboxes[i].value));
    }
    return array;
}

function findUsers(){
    var leaseFacilities = getCheckedCheckBox();
    if(leaseFacilities.length === 0){
        alert('Please, check at least one object.');
    }else{
        var r = confirm('download selected user(s)?');
        if (r == true) {
            const XHR = new XMLHttpRequest();
            XHR.addEventListener( 'error', function(event) {
                alert( 'Oops! Something went wrong.' );
            });
            XHR.onload = function(e) {
                if (this.status == 200) {
                    var blob = new Blob([this.response], {type: 'application/json'});
                    let a = document.createElement("a");
                    a.style = "display: none";
                    document.body.appendChild(a);
                    let url = window.URL.createObjectURL(blob);
                    a.href = url;
                    a.download = 'myFile.json';
                    a.click();
                    window.URL.revokeObjectURL(url);
                }else{
                }
            };
            XHR.open( 'POST','upload.download.entity/saveUserByCheckbox.jsp');
            XHR.setRequestHeader( 'Content-Type', 'application/x-www-form-urlencoded' );
            XHR.send('ID='+JSON.stringify(leaseFacilities));
        }
    }
}

function toggleAllCheckBoxes(source) {
    checkboxes = document.getElementsByName('lfcheckboxes');
    for(var i=0; i<checkboxes.length;i++) {
        checkboxes[i].checked = source.checked;
    }
}
