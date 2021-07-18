//to find some values through the table with possibility to choose type of value
function searchBy(elementID,col) {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById(elementID);
    filter = input.value.toUpperCase();
    table = document.getElementById("myTable");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[col];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}


//to move header while scrolling
window.onscroll = function() {myFunction2()};
var header = document.getElementById("myHeader");
var sticky = header.offsetTop;

function myFunction2() {
    if (window.pageYOffset > sticky) {
        header.classList.add("sticky");
    } else {
        header.classList.remove("sticky");
    }
}

// to get value of selected item in editTicketTags page
function getSelectValue()
{
    var selectedValue = document.getElementById("tagSelection").value;
    document.getElementById("inputTagId").value = selectedValue;
}


