import React from 'react';

function ProductListItem(props) {
  const { productId, name, price, image, shortDescription } = props.product;
  const cost = `$${(price / 100).toFixed(2)}`;

  return (
    <div className="col-12 col-md-6 col-lg-4 my-3">
      <div
        className="card h-100 item"
        onClick={() => props.setView('details', { productId })}
      >
        <img className="card-img-top card-image contain" src={image} alt="A ridiculous exercise tool"/>
        <div className="card-body">
          <h5 className="card-title">{name}</h5>
          <h6 className="card-subtitle text-muted">{cost}</h6>
          <p className="card-text">{shortDescription}</p>
        </div>
      </div>
    </div>
  );
}

export default ProductListItem;
