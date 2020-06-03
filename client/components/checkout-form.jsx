import React from 'react';
import FormInstruction from './form-instruction';

class CheckoutForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      creditCard: '',
      shippingAddress: '',
      failedSubmission: false
    };
    this.handleChange = this.handleChange.bind(this);
    this.validateInputs = this.validateInputs.bind(this);
  }

  handleChange(event) {
    const newState = {};
    const { name, value } = event.target;
    newState[name] = value;
    this.setState(newState);
  }

  validateInputs() {
    const { name, creditCard, shippingAddress } = this.state;
    if (name && creditCard && shippingAddress) {
      this.props.placeOrder(this.state);
    } else {
      const newState = {};
      newState.failedSubmission = true;
      this.setState(newState);
    }
  }

  render() {
    const { cart } = this.props;
    const total = `$${(cart.reduce((acc, curr) => acc + curr.price, 0) / 100).toFixed(2)}`;
    const submitAttempted = this.state.failedSubmission;

    return (
      <div className="row flex-column px-3">
        <h1 className="mt-4">Checkout</h1>
        <h5 className="mt-4 text-muted">Order Total {total}</h5>
        <form>
          <div className="form-group">
            <label htmlFor="customerName">Name</label>
            <input id="customerName" name="name" type="text" className="form-control" onChange={this.handleChange} required/>
            <FormInstruction submitAttempted={submitAttempted} userInput={this.state.name} name="name"/>
          </div>
          <div className="form-group">
            <label htmlFor="customerCreidtCard">Credit Card</label>
            <input id="customerCreditCard" name="creditCard" type="text" className="form-control" onChange={this.handleChange} required/>
            <FormInstruction submitAttempted={submitAttempted} userInput={this.state.creditCard} name="creditCard"/>
          </div>
          <div className="form-group">
            <label htmlFor="customerAddress">Shipping Address</label>
            <textarea id="customerAddress" name="shippingAddress" rows="5" className="form-control" onChange={this.handleChange} required></textarea>
            <FormInstruction submitAttempted={submitAttempted} userInput={this.state.shippingAddress} name="shippingAddress"/>
          </div>
          <div className="d-flex justify-content-between mt-4">
            <h6
              className="back text-muted mt-4 ml-4 mb-0"
              onClick={() => this.props.setView('catalog', {})}
            >
              <i className="fas fa-caret-left"></i> Continue Shopping
            </h6>
            <button
              className="btn btn-primary"
              type="button"
              onClick={() => this.validateInputs()}
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
