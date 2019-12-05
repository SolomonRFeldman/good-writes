import React, { Component } from 'react';
import LogInButton from './LogInButton';
import LogInForm from './LogInForm';

export default class LogInButtonContainer extends Component {

  constructor() {
    super()
    this.state = { showForm: false }
  }

  handleFormShow = () => this.setState({ showForm: true })
  handleFormClose = () => this.setState({ showForm: false })

  render() {
    return (
      <>
        <LogInButton className={this.props.className} onClick={this.handleFormShow} />
        <LogInForm show={this.state.showForm} handleClose={this.handleFormClose} />
      </>
    )
  }

}