/*
*   This content is licensed according to the W3C Software License at
*   https://www.w3.org/Consortium/Legal/2015/copyright-software-and-document
*
*   File:   Treeitem.js
*
*   Desc:   Setup click events for Tree widget examples
*/

/**
 * ARIA Treeview example
 * @function onload
 * @desc  after page has loaded initialize all treeitems based on the role=treeitem
 */

window.addEventListener('load', function () {
    var treeitems = document.querySelectorAll('[role="treeitem"]');
  
    for (var i = 0; i < treeitems.length; i++) {
      treeitems[i].addEventListener('click', function (event) {
        var treeitem = event.currentTarget;
        var data_id = treeitem.getAttribute('data-id');
        var data_name = treeitem.getAttribute('data-name');
        
        document.getElementById('last_action_id').value = data_id;
        document.getElementById('folder_id').value = data_id;
        document.getElementById('parent_id').value = data_id;
        
        var label = treeitem.getAttribute('aria-label');
        if (!label) {
          label = data_name;
        }
        document.getElementById('last_action').value = label;
        
        event.stopPropagation();
        event.preventDefault();
      });
    }

    var btnViewFile = document.getElementById('btnViewFile');
    if (btnViewFile === undefined || btnViewFile === null) {
      return;
    }
    btnViewFile.onclick = function() {
      var file_id = document.getElementById('parent_id').value;
      if (file_id == undefined) {
        alert('File not found!');
        return;
      }
      window.location.href = "/file_storages/" + file_id;
    }

    var btnClear = document.getElementById('btnClear');
    if (btnClear === undefined || btnClear === null) {
      return;
    }
    btnClear.onclick = function() {
      document.getElementById('last_action').value = "";
      document.getElementById('last_action_id').value = "";
      document.getElementById('folder_id').value = "";
      document.getElementById('parent_id').value = "";
    }
  });