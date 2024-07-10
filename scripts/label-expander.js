// mouseenter | mouseleave

(function initForms() {
    const forms = document.querySelectorAll('.address-fieldset');
    const formPromises = Array.from(forms).map(form => addFieldset(form));
    Promise.all(formPromises).then(() => {
        console.log('listen');
        initListeners(); // Initialize listeners after all forms are processed
    });
})();

function addFieldset(form) {
    return fetch('address-fields.html')
        .then(response => response.text())
        .then(data => {
            form.innerHTML += data;
            console.log('add')
        });
}

function initListeners() {
    document.querySelectorAll('label, legend').forEach(activator => activator.addEventListener('click', showInfo));
};

const infoTable = document.getElementById("mysql-info");

function showInfo(event) {
    console.log(event.target);
    infoTable.innerHTML = 
        `<hr/>
        <h3>Database Connection</h3>
        <table>
            <thead>
                <tr>
                    <th>Table</th>
                    <th>Column</th>
                    <th>Foriegn Key</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${event.target.getAttribute('data-table') ??  ""}</td>
                    <td>${event.target.getAttribute('data-column') ??  ""}</td>
                    <td>${event.target.getAttribute('data-foreign') ??  ""}</td>
                </tr>
            </tbody>
        </table`
}
