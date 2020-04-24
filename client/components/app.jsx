import React from 'react';
import Header from './header';
import ProductList from './product-list';

class App extends React.Component {

  render() {
    return (
      <div>
        <Header />
        <div className="container my-4">
          <ProductList />
        </div>
      </div>
    );
  }
}

export default App;
