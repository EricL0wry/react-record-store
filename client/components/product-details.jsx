import React from 'react';

class ProductDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: null
    };
  }

  componentDidMount() {
    const { productId } = this.props.params;
    fetch(`/api/products/${productId}`)
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
            <div className="card-body">
              <h6
                className="back text-muted mt-0 ml-4 mb-0"
                onClick={() => this.props.setView('catalog', {})}
              >
              &lt; Back to Catalog
              </h6>
            </div>
            <div className="card-body d-flex flex-row flex-wrap py-0 col-12">
              <div className="card-body col-lg-6 col-xl-5 px-0">
                <img className="detail-image contain px-0 col-12" src={image} alt={name}/>
              </div>
              <div className="card-body col-lg-6 col-xl-7 px-0">
                <h2>{name}</h2>
                <h4 className="text-muted">{cost}</h4>
                <p>{shortDescription}</p>
                <button
                  className="btn btn-primary"
                  onClick={() => this.props.addToCart(this.state.product)}
                >
                  Add to Cart
                </button>
              </div>
            </div>
            <div className="card-body">
              {longDescription.split('\n').map((string, index) => {
                return <p key={index}>{string}</p>;
              })}
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default ProductDetails;
