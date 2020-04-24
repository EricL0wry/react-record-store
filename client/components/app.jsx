import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: { name: 'catalog', params: {} }
    };
    this.setView = this.setView.bind(this);
  }

  setView(name, params) {
    this.setState({
      view: { name, params }
    });
  }

  render() {
    const { name } = this.state.view;
    return (
      <div>
        <Header />
        <div className="container my-4">
          {name === 'catalog' ? <ProductList setView={this.setView} /> : <ProductDetails />}
        </div>
      </div>
    );
  }
}

export default App;
