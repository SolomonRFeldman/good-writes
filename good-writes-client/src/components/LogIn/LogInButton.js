import React, { Component } from 'react';
import Button from 'react-bootstrap/Button';

export default class LogInButton extends Component {

  render() {
    return (
      <Button varient='primary' className={this.props.className} onClick={this.props.onClick}>Log In</Button>
    )
  }

}