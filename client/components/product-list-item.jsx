import React from 'react';

function ProductListItem(props) {
  const { productId, name, price, image, shortDescription, bandName } = props.product;
  const cost = `$${(price / 100).toFixed(2)}`;

  return (
    <div className="col-12 col-md-6 col-lg-4 my-3">
      <div
        className="card product-card h-100 pt-3 bg-transparent"
        onClick={() => props.setView('details', { productId })}
      >
        <img className="card-img-top card-image contain" src={image} alt={name}/>
        <div className="card-body px-3 pb-3">
          <h6 className="card-subtitle">{bandName}</h6>
          <h5 className="card-title mb-3">{name}</h5>
          <h6 className="card-subtitle text-muted">{cost}</h6>
          <p className="card-text">{shortDescription}</p>
        </div>
      </div>
    </div>
  );
}

export default ProductListItem;
