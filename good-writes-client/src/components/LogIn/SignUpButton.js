import React, { Component } from 'react';
import Button from 'react-bootstrap/Button';

export default class SignUpButton extends Component {

  render() {
    return (
      <Button variant='secondary' className={this.props.className}>Sign Up</Button>
    )
  }

}