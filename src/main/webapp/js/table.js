function getRandomArbitrary(min, max) {
    return Math.round(Math.random() * (max - min) + min);
}

function createTable(tableId, toolBarButtons){
    var toolbar = "toolbar"+ getRandomArbitrary(0, 100000);
    var table = $(tableId).DataTable({
        "paging": false,
        "dom": 'f<"'+ toolbar +'">rtip'
    });
    $("div." + toolbar).html(toolBarButtons);
    $(tableId + ' tbody').on( 'click', 'tr', function () {
        $(this).toggleClass('selected_row');
    } );
    table.getSelected = function(){
        var data = $("tr.selected_row").map(function() {
            return this.getAttribute('value');
        }).get();
        console.log(data);
        return data;
    }
    return table;
}

function sendDelete(data, url){
    if(data.length === 0){
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
            XHR.open( 'POST',url);
            XHR.setRequestHeader( 'Content-Type', 'application/x-www-form-urlencoded' );
            XHR.send('IDs='+JSON.stringify(data));
        }
    }
}

function sendEdit(data, url){
    if(data.length === 0 || data.length > 1){
        alert('Please, check at one object.');
    }else{
        window.location.href = url + "?id=" + data[0];
    }
}

