

$(document).ready(function() {
    initDocument();
});

function initDocument() {
    let extractorCapacity = document.getElementById("extractorCapacity");
    let extractorCapacityld = extractorCapacity.ldBar;
    extractorCapacityld.set(24);
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems, {});
}