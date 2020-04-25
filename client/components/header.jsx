import React from 'react';

function Header(props) {
  const { cartItemCount } = props;

  return (
    <nav className="navbar navbar-dark bg-dark">
      <div className="container">
        <a href="#" className="navbar-brand ml-1">
          <i className="fas fa-broom mr-2"></i>
        Wicked Sales
        </a>
        <div className="cart navbar-brand d-flex flex-row">
          <h6 className="mb-0">0 Items</h6>
          <i className="fas fa-shopping-cart ml-2"></i>
        </div>
      </div>
    </nav>
  );
}

export default Header;
