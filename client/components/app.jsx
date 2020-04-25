import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: { name: 'catalog', params: {} },
      cart: []
    };
    this.setView = this.setView.bind(this);
  }

  componentDidMount() {
    this.getCartItems();
  }

  setView(name, params) {
    this.setState({
      view: { name, params }
    });
  }

  getCartItems() {
    fetch('/api/cart')
      .then(res => res.json())
      .then(data => this.setState({ cart: data }))
      .catch(error => console.error(error));
  }

  render() {
    const { name, params } = this.state.view;
    const list = <ProductList setView={this.setView} />;
    const details = <ProductDetails setView={this.setView} params={params} />;

    return (
      <div>
        <Header cartItemCount={this.state.cart.lenth}/>
        <div className="container my-4">
          {name === 'catalog' ? list : details}
        </div>
      </div>
    );
  }
}

export default App;
