(function initListeners() {
    document.getElementById("contractor-btn").addEventListener('click', () => toggleSections("contractor-section"));
    document.getElementById("insurance-btn").addEventListener('click', () => toggleSections("insurance-section"));
    document.getElementById("project-btn").addEventListener('click', () => toggleSections("project-section"));
})();

function toggleSections(sectionId) {
    const sections = document.querySelectorAll('section');
    sections.forEach(section => section.hidden = ! [sectionId, "address-section"].includes(section.id));
}