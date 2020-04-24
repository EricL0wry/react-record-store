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
        // this.setState({ products: data });
        // eslint-disable-next-line no-console
        console.log(data);
      })
      .catch(err => console.error(err));
  }

  render() {
    // const cards = this.state.products.map(product => <ProductListItem product={product} />)
    return (
      <div className="row">
        <ProductListItem />
      </div>
    );
  }

}

export default ProductList;
