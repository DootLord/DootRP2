var ores = ["iron", "iron"];
const oreDetails = {
    "iron": {
        name: "Iron",
        timeToProcess: 5,
        timeToBurn: 10,
        color: "#a9a9a9",
    }
}
// Spawn point for all ore elements
const oreContainer = document.getElementById("ore-container");

// Iterates over `ores` and manages creation for each
function initOres() {
    ores.forEach(ore => {
        createOreElement(ore);
    })

    setupDragDrop();
}

// Takes ore data and creates an element for it on the webpage.
function createOreElement(ore) {
    const oreData = oreDetails[ore];
    const oreElement = document.createElement("div");
    oreElement.classList.add("ore");
    oreElement.style.backgroundColor = oreData.color;
    oreElement.innerText = oreData.name;

    oreContainer.appendChild(oreElement);
}

function setupDragDrop() {
    // enable draggables to be dropped into this
    interact('.dropzone').dropzone({
        // only accept elements matching this CSS selector
        accept: '.ore',
        // Require a 75% element overlap for a drop to be possible
        overlap: 0.75,

        // listen for drop related events:

        ondropactivate: function (event) {
            // add active dropzone feedback
            event.target.classList.add('drop-active')
        },
        ondragenter: function (event) {
            var draggableElement = event.relatedTarget
            var dropzoneElement = event.target

            // feedback the possibility of a drop
            dropzoneElement.classList.add('drop-target')
            draggableElement.classList.add('can-drop')
            draggableElement.textContent = 'Dragged in'
        },
        ondragleave: function (event) {
            // remove the drop feedback style
            event.target.classList.remove('drop-target')
            event.relatedTarget.classList.remove('can-drop')
            event.relatedTarget.textContent = 'Dragged out'
        },
        ondrop: function (event) {
            event.relatedTarget.textContent = 'Dropped'
        },
        ondropdeactivate: function (event) {
            // remove active dropzone feedback
            event.target.classList.remove('drop-active')
            event.target.classList.remove('drop-target')
        }
    })

    interact('.ore')
        .draggable({
            inertia: true,
            // modifiers: [
            //     interact.modifiers.restrictRect({
            //         restriction: 'parent',
            //         endOnly: true
            //     })
            // ],
            autoScroll: true,
            // dragMoveListener from the dragging demo above
            listeners: { move: dragMoveListener }
        })
}

function dragMoveListener (event) {
    var target = event.target
    // keep the dragged position in the data-x/data-y attributes
    var x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx
    var y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy
  
    // translate the element
    target.style.transform = 'translate(' + x + 'px, ' + y + 'px)'
  
    // update the posiion attributes
    target.setAttribute('data-x', x)
    target.setAttribute('data-y', y)
  }

/**
*  While the majority of this document is written in vanilla JS, 
*  this is a jQuery function because it's one of the few actually useful jQuery functions!
*/
$(document).ready(initOres);