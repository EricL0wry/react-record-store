import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';
import CartSummary from './cart-summary';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: { name: 'catalog', params: {} },
      cart: []
    };
    this.setView = this.setView.bind(this);
    this.addToCart = this.addToCart.bind(this);
  }

  componentDidMount() {
    this.getCartItems();
  }

  setView(name, params) {
    this.setState({
      view: { name, params }
    });
  }

  addToCart(product) {
    const { productId } = product;
    const data = { productId };
    const options = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    };
    fetch('/api/cart', options)
      .then(res => res.json())
      .then(data => {
        const cart = this.state.cart.slice();
        cart.push(data);
        this.setState({ cart });
      })
      .catch(error => console.error(error));
  }

  getCartItems() {
    fetch('/api/cart')
      .then(res => res.json())
      .then(data => this.setState({ cart: data }))
      .catch(error => console.error(error));
  }

  placeOrder(order) {
    const options = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(order)
    };

    fetch('/api/orders', options)
      .then(() => this.setState({ cart: [], view: { name: 'catalog', params: {} } }))
      .catch(error => console.error(error));
  }

  render() {
    const { name, params } = this.state.view;
    const catalog = <ProductList setView={this.setView} />;
    const details = <ProductDetails setView={this.setView} addToCart={this.addToCart} params={params} />;
    const cart = <CartSummary setView={this.setView} cart={this.state.cart} />;
    let view;
    if (name === 'catalog') view = catalog;
    if (name === 'details') view = details;
    if (name === 'cart') view = cart;

    return (
      <div>
        <Header cartItemCount={this.state.cart.length} setView={this.setView}/>
        <div className="container my-4">
          {view}
        </div>
      </div>
    );
  }
}

export default App;
