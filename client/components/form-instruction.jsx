import React from 'react';

function FormInstruction(props) {
  const { submitAttempted, userInput, name } = props;
  let instructions;

  if (submitAttempted) {
    if (!userInput) {
      if (name === 'name') {
        instructions = 'Please enter your name';
      } else if (name === 'creditCard') {
        instructions = 'Please enter your credit card information';
      } else if (name === 'shippingAddress') {
        instructions = 'Please enter your shipping address';
      }
    } else {
      instructions = ' ';
    }
  }

  return (
    <div className="form-instructions">
      {instructions}
    </div>
  );
}

export default FormInstruction;
