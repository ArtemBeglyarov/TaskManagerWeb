function getCheckedCheckBox(){
    var array = [];
    var checkboxes = document.querySelectorAll('input[type=checkbox][name=lfcheckboxes]:checked');
    for (var i = 0; i < checkboxes.length; i++) {
        array.push(Number(checkboxes[i].value));
    }
    return array;
}

function deleteUsers(){
    var leaseFacilities = getCheckedCheckBox();
    if(leaseFacilities.length === 0){
        alert('Please, check at least one object.');
    }else{
        var r = confirm('Are you sure, want to delete the user(s)?');
        if (r == true) {
            const XHR = new XMLHttpRequest();
            XHR.addEventListener( 'error', function(event) {
                alert( 'Oops! Something went wrong.' );
            });
            XHR.addEventListener( 'load', function(event) {
                location.reload();
            });
            XHR.open( 'POST','removeUser.jsp');
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
