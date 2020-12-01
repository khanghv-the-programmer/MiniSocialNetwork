/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



let button = document.getElementById("delete-button");

if (button !== null) {
    button.addEventListener("click", function (event) {
        event.preventDefault();
        Swal.fire({
            title: 'Are you sure you want to delete this article?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                let form = document.getElementById("delete-form");
                form.submit();
            }
        });
    });
}


let dlcommentbutton = document.getElementsByClassName("delete-comment-button");
let dlcmtform = document.getElementsByClassName("delete-comment-form");

for (let i = 0; i < dlcommentbutton.length; i++) {
    dlcommentbutton[i].addEventListener("click", function (event) {
        
        event.preventDefault();
        Swal.fire({
            title: 'Are you sure to delete this comment?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                dlcmtform[i].submit();
            }
        });
    });
}


function popUpLike() {
    var popup = document.getElementById("myPopup");
    popup.classList.toggle("show");
}

function popUpDislike() {
    var popup = document.getElementById("myPopup1");
    popup.classList.toggle("show");
}

function showList()
{
    var getClick = document.getElementById("noti-list");
    if (getClick.style.display === "none")
    {
        getClick.style.display = "inline-block";
    } else
    {
        getClick.style.display = "none";
    }
}

function showNoti()
{
    let noti = document.getElementById("noti-signal");
    if (noti !== null)
    {
        Swal.fire({
            icon: 'info',
            title: 'Attention',
            text: 'You have unread notification!'
        }
        );
    }
    verifyNoti();
}



