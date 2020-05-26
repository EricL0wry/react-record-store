import React from 'react';

function CartSummaryItem(props) {
  const { image, name, price, shortDescription, bandName, year, genre } = props.product;
  const cost = `$${(price / 100).toFixed(2)}`;

  return (
    <div className="col-12 px-0 my-3">
      <div className="card">
        <div className="card-body d-flex flex-row flex-wrap py-0 align-items-center">
          <div className="card-body col-md-7 col-lg-6 col-xl-5 py-sm-3 p-0">
            <img className="detail-image contain px-0 col-12" src={image} alt={name} />
          </div>
          <div className="card-body col-md-5 col-lg-6 col-xl-7 py-sm-3 p-0 pt-3">
            <h4 className="card-subtitle pt-sm-3">{bandName}</h4>
            <h2>{name}</h2>
            <h4 className="text-muted">{cost}</h4>
            <p>{year} | {genre} <br />{shortDescription}</p>
          </div>
        </div>
      </div>
    </div>
  );
}

export default CartSummaryItem;
