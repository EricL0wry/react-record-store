import React from 'react';

function ProductListItem(props) {

  return (
    <div className="col-4">
      <div className="card">
        <img className="card-img-top" src="./images/shake-weight.jpg" alt="A ridiculous exercise tool"/>
        <div className="card-body">
          <h5 className="card-title">Shake Weight</h5>
          <h6 className="card-subtitle text-muted">$100.00</h6>
          <p className="card-text">Dynamic Inertia technology ignites muscles in arms, shoulders, and chest.</p>
        </div>
      </div>
    </div>
  );
}

export default ProductListItem;
