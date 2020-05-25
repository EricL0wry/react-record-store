import React from 'react';

function Header(props) {
  const { cartItemCount } = props;

  return (
    <nav className="navbar navbar-dark bg-dark fixed-top">
      <div className="container px-0 px-sm-3">
        <span className="navbar-brand ml-1" onClick={() => props.setView('catalog', {})}>
          <img src="/images/IntoTheGroove.svg" alt="Brand Logo" className="logo"/>
        </span>
        <div
          className="cart navbar-brand d-flex flex-row mr-1"
          onClick={() => props.setView('cart', {})}
        >
          <h6 className="mb-0">{`${cartItemCount} Items`}</h6>
          <i className="fas fa-shopping-cart ml-2"></i>
        </div>
      </div>
    </nav>
  );
}

export default Header;
