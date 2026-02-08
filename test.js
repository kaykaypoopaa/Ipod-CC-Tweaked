function copyCommand() {
    const text = document.getElementById("installCommand").innerText;
    navigator.clipboard.writeText(text).then(() => {
        
    });
}
