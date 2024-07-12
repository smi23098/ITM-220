(function initListeners() {
    document.getElementById("contractor-btn").addEventListener('click', () => toggleSections("contractor-section"));
    document.getElementById("insurance-btn").addEventListener('click', () => toggleSections("insurance-section"));
    document.getElementById("project-btn").addEventListener('click', () => toggleSections("project-section"));
    document.getElementById("contractor-insurance-btn").addEventListener('click', () => toggleSections("contractor-insurance-section"));
    document.getElementById("project-task-btn").addEventListener('click', () => toggleSections("project-task-section"));
    document.getElementById("project-template-btn").addEventListener('click', () => toggleSections("project-template-section"));
})();

function toggleSections(sectionId) {
    const sections = document.querySelectorAll('section');
    sections.forEach(section => section.hidden = ! [sectionId, "address-section"].includes(section.id));
}