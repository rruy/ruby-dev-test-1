window.addEventListener('load', function () {
  var modalUpload = document.getElementById("modal_upload");
  var btnUpload = document.getElementById("btnUpload");
  var spanUpload = document.getElementsByClassName("close")[0];

  if (btnUpload === undefined || btnUpload == null) {
    return;
  }
  btnUpload.onclick = function() {
    modalUpload.style.display = "block";
  }
  spanUpload.onclick = function() {
    modalUpload.style.display = "none";
  }
  window.onclick = function(event) {
    if (event.target == modalUpload) {
      modalUpload.style.display = "none";
    }
  }

  var modalFolder = document.getElementById("modal_folder");
  var btnFolder = document.getElementById("btnFolder");
  var spanFolder = document.getElementsByClassName("close")[1];

  if (btnFolder === undefined || btnFolder == null) {
    return;
  }
  btnFolder.onclick = function() {
    modalFolder.style.display = "block";
  }
  spanFolder.onclick = function() {
    modalFolder.style.display = "none";
  }
  window.onclick = function(event) {
    if (event.target == modalFolder) {
      modalFolder.style.display = "none";
    }
  }

});