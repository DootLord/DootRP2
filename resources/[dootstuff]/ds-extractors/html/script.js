$('#main').hide();
let extractBtn = document.getElementById("extractBtn");

$(document).ready(function () {
    initDocument();
    extractBtn.addEventListener("click", extract);
    // Listener for NUI messages
    window.addEventListener('message', nuiEventHandler);
    $('#main').hide();
});

// Materialize init
function initDocument() {
    let extractorCapacity = document.getElementById("extractorCapacity");
    let extractorCapacityld = extractorCapacity.ldBar;
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems, {});
}

// Extractor button NUI event
function extract() {
    $.post('https://qb-extractors/extract', JSON.stringify({
        action: "extract"
    }));
}

// NUI Event handler
function nuiEventHandler(event) {
    let item = event.data;

    if (item.display === true) {
        $("#main").show();
    } else if (item.display === false) {
        $("#main").hide();
    }
}

