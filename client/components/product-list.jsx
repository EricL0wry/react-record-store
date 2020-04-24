import React from 'react';
import ProductListItem from './product-list-item';

class ProductList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      products: []
    };
  }

  componentDidMount() {
    this.getProducts();
  }

  getProducts() {
    fetch('/api/products')
      .then(res => res.json())
      .then(data => {
        this.setState({ products: data });
        // eslint-disable-next-line no-console
        console.log(data);
      })
      .catch(err => console.error(err));
  }

  render() {
    let cards;
    if (this.state.products.length) {
      cards = this.state.products.map(product => <ProductListItem key={product.productId} product={product} />);
    }
    return (

      <div className="row align-items-stretch">
        {cards || ''}
      </div>

    );
  }

}

export default ProductList;
