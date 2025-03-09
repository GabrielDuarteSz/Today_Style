let cart = [];

document.addEventListener('DOMContentLoaded', () => {
    const addToCartButtons = document.querySelectorAll('.add-to-cart');
    
    addToCartButtons.forEach(button => {
        button.addEventListener('click', (e) => {
            const productItem = e.target.closest('.product-item');
            const productName = productItem.querySelector('h2').innerText;
            const productPrice = productItem.querySelector('p').innerText;
            const productImage = productItem.querySelector('img').src;

            const product = {
                name: productName,
                price: productPrice,
                image: productImage
            };

            cart.push(product);
            updateCart();
        });
    });
});

function updateCart() {
    const cartContainer = document.querySelector('.cart-items');
    cartContainer.innerHTML = '';

    cart.forEach(item => {
        const cartItem = document.createElement('div');
        cartItem.classList.add('cart-item');
        cartItem.innerHTML = `
            <img src="${item.image}" alt="${item.name}" width="50">
            <p>${item.name}</p>
            <p>${item.price}</p>
        `;
        cartContainer.appendChild(cartItem);
    });
}
