import React, { Component } from 'react';
import ButtonToolbar from 'react-bootstrap/ButtonToolbar'
import LogInButtonContainer from './LogInButtonContainer'
import SignUpButtonContainer from './SignUpButtonContainer'

export default class LogInButtons extends Component {

  render() {
    return (
      <ButtonToolbar className='ml-auto'>
        <LogInButtonContainer className='mr-sm-2' />
        <SignUpButtonContainer />
      </ButtonToolbar>
    )
  }

}