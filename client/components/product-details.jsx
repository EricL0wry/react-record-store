import React from 'react';

class ProductDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: null
    };
  }

  componentDidMount() {
    fetch('/api/products/1')
      .then(res => res.json())
      .then(data => this.setState({ product: data }))
      .catch(error => console.error(error));
  }

  render() {
    if (!this.state.product) {
      return null;
    }

    const { image, name, price, shortDescription, longDescription } = this.state.product;
    const cost = `$${(price / 100).toFixed(2)}`;
    return (
      <div className="row">
        <div className="col-12">
          <div className="card">
            <h6 className="back text-muted mt-4 ml-4 mb-0">&lt; Back to catalog</h6>
            <div className="card-body d-flex flex-row py-0">
              <img className="col-5 detail-image contain pl-0" src={image} alt={name}/>
              <div className="card-body col-7">
                <h2>{name}</h2>
                <h4 className="text-muted">{cost}</h4>
                <p>{shortDescription}</p>
              </div>
            </div>
            <div className="card-body">
              <p>{longDescription}</p>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default ProductDetails;
