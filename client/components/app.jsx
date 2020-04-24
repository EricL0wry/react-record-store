import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';

class App extends React.Component {

  render() {
    return (
      <div>
        <Header />
        <div className="container my-4">
          {/* <ProductList /> */}
          <ProductDetails />
        </div>
      </div>
    );
  }
}

export default App;
