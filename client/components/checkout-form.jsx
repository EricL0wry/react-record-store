import React from 'react';

class CheckoutForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      creditCard: '',
      shippingAddress: ''
    };
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    const newState = {};
    const { name, value } = event.target;
    newState[name] = value;
    this.setState(newState);
  }

  render() {
    const { cart } = this.props;
    const total = `$${(cart.reduce((acc, curr) => acc + curr.price, 0) / 100).toFixed(2)}`;

    return (
      <div className="row flex-column px-3">
        <h1 className="mt-4">Checkout</h1>
        <h5 className="mt-4 text-muted">Order Total {total}</h5>
        <form>
          <div className="form-group">
            <label htmlFor="customerName">Name</label>
            <input id="customerName" name="name" type="text" className="form-control" onChange={this.handleChange}/>
          </div>
          <div className="form-group">
            <label htmlFor="customerCreidtCard">Credit Card</label>
            <input id="customerCreditCard" name="creditCard" type="text" className="form-control" onChange={this.handleChange}/>
          </div>
          <div className="form-group">
            <label htmlFor="customerAddress">Shipping Address</label>
            <textarea id="customerAddress" name="shippingAddress" rows="5" className="form-control" onChange={this.handleChange}></textarea>
          </div>
          <div className="d-flex justify-content-between mt-4">
            <h6
              className="back text-muted mt-4 ml-4 mb-0"
              onClick={() => this.props.setView('catalog', {})}
            >
              &lt; Continue Shopping
            </h6>
            <button
              className="btn btn-primary"
              type="button"
              onClick={() => this.props.placeOrder(this.state)}
            >
              Place Order
            </button>
          </div>
        </form>
      </div>
    );
  }
}

export default CheckoutForm;
