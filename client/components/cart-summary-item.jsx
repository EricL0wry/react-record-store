import React from 'react';

function CartSummaryItem(props) {
  const { image, name, price, shortDescription } = props.product;
  const cost = `$${(price / 100).toFixed(2)}`;

  return (
    <div className="col-12 px-0 my-3">
      <div className="card">
        <div className="card-body d-flex flex-row py-0 align-items-center">
          <img className="col-4 card-image contain py-3 pl-0" src={image} alt={name} />
          <div className="col-8 card-body">
            <h2>{name}</h2>
            <h4 className="text-muted">{cost}</h4>
            <p>{shortDescription}</p>
          </div>
        </div>
      </div>
    </div>
  );
}

export default CartSummaryItem;
