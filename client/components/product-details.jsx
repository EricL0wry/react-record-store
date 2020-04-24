import React from 'react';

class ProductDetails extends React.Component {
  constructor(props) {
    super(props);
    this.status = {
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
    return (
      null
    );
  }
}

export default ProductDetails;
