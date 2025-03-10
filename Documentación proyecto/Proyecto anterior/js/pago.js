// Función para cambiar el formulario según el método de pago seleccionado
function changePaymentForm() {
    const paymentMethod = document.getElementById('payment-method').value;
    const cardForm = document.getElementById('card-form');
    const transferForm = document.getElementById('transfer-form');
    const cashForm = document.getElementById('cash-form');
    
    // Ocultamos todos los formularios
    cardForm.style.display = 'none';
    transferForm.style.display = 'none';
    cashForm.style.display = 'none';
    
    // Mostramos el formulario correspondiente
    if (paymentMethod === 'card') {
        cardForm.style.display = 'block';
    } else if (paymentMethod === 'transfer') {
        transferForm.style.display = 'block';
    } else if (paymentMethod === 'cash') {
        cashForm.style.display = 'block';
    }
}

// Llamamos a la función para que se aplique al cargar la página
document.addEventListener("DOMContentLoaded", function() {
    // Llamamos a la función cuando el documento se haya cargado completamente
    changePaymentForm();

    // Event listener para el cambio de método de pago
    const paymentMethodSelect = document.getElementById('payment-method');
    paymentMethodSelect.addEventListener('change', changePaymentForm);
});
