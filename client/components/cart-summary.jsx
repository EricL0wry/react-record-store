import React from 'react';
import CartSummaryItem from './cart-summary-item';

function CartSummary(props) {
  const { cart } = props;
  let cards;
  let total;

  if (!cart.length) {
    cards = <h2>Your Cart is Empty</h2>;
  } else {
    cards = cart.map(product => <CartSummaryItem key={product.cartItemId} product={product} />);
    total = `$${(cart.reduce((acc, curr) => acc + curr.price, 0) / 100).toFixed(2)}`;

  }
  return (
    <div className="row flex-column px-3">
      <h6
        className="back text-muted mt-4 ml-4 mb-0"
        onClick={() => props.setView('catalog', {})}
      >
        &lt; Back to catalog
      </h6>
      <h1 className="mt-4">My Cart</h1>
      {cards}
      <h3 className="mt-4">Item Total {total}</h3>
    </div>
  );
}

export default CartSummary;
