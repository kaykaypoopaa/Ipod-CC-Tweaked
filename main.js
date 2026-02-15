const logo = document.querySelector('.main-logo');
const home = document.querySelector('.home-button');
const about = document.querySelector('.about-button');

logo.addEventListener('click', (event) => {
    window.location.href = 'index.html';
})

home.addEventListener('click', (event) => {
    window.location.href = 'index.html';
})

about.addEventListener('click', (event) => {
    window.location.href = 'about.html';
})

function addDoc(name, desc, syntax, params, example) {
    const container = document.getElementById('docs-container'); // Make sure you have this ID in your HTML!
    
    // This part color-codes the example string automatically
    // This part color-codes the example string automatically
let highlightedExample = example
    .replace(/\n/g, '<br>') // Ensures \n creates a new line
    .replace(/(".*?")/g, '<span class="lg">$1</span>')     // Strings -> Green
    .replace(/\b(\d+)\b/g, '<span class="ld">$1</span>')   // Numbers -> Blue
    // NEW: Catch anything starting with UILib. and highlight it yellow
    .replace(/(UILib\.\w+)/g, '<span class="ln">$1</span>') 
    // Expanded keywords to catch Lua and CC-specific terms
    .replace(/\b(function|end|local|print|peripheral|find|colors|then|do|if|while|else|return)\b/g, '<span class="ln">$1</span>');
    let paramList = params.map((p, i) => `${i+1}. ${p}`).join('<br>');

    const html = `
        <span class="white-text"><br>${name}(), ${desc}<br>Syntax:<br></span>
        <div class="le">
            <span class="ln">${name}</span>(<span class="ld">${syntax}</span>)
            <span class="white-text"><br>${paramList}</span>
            <span><br>Example usage:<br></span>
            <code class="white-space">${highlightedExample}</code>
        </div>
    `;
    
    container.insertAdjacentHTML('beforeend', html);
}

// Example for your addButton
addDoc(
    "UILib.setup",
    "this function is essential to the uilib working, if you don't run this function, it simply will not work.",
    "monitor",
    [
        "monitor: Peripheral; monitor / term"
    ],
    'local monitor = peripheral.find("monitor")\nUILib.setup(monitor)'
);
addDoc(
    "UILib.addButton", 
    "this function creates a button in the buttonList variable.",
    "x, y, width, height, label, color, action",
    [
        "x: number; x position",
        "y: number; y position",
        "width: number; width",
        "height: number; height",
        "label: string; text",
        "color: color; color",
        "action: function; callback"
    ],
    'UILib.addButton(10, 10, 100, 20, "Click Me", colors.blue, function() print("Clicked!") end)'
);

addDoc(
    "UILib.drawAll",
    "this function draws all buttons in the buttonList variable.",
    "",
    [],
    'local monitor = peripheral.find("monitor") or term\nUILib.setup(monitor)\nUILib.addButton(10, 10, 100, 20, "Click Me", colors.blue, function() print("Clicked!") end)\nUILib.drawAll()'
);

addDoc(
    "UILib.clickEvent",
    "this function adds a click event listener to every button in the buttons argument.",
    "buttons",
    [
        "buttons: table; button list"
    ],
    'local monitor = peripheral.find("monitor") or term\nUILib.setup(monitor)\nUILib.addButton(10, 10, 100, 20, "Click Me", colors.blue, function() print("Clicked!") end)\nUILib.drawAll()\nwhile true do\n    UILib.clickEvent(UILib.buttonList)\nend'
);