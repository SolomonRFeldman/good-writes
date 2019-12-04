import React, { Component } from 'react';
import Form from 'react-bootstrap/Form'
import ButtonToolbar from 'react-bootstrap/ButtonToolbar'
import LogInButtonContainer from './LogInButtonContainer'

export default class LogInButtons extends Component {

  render() {
    return (
      <ButtonToolbar className='ml-auto'>
        <LogInButtonContainer />
      </ButtonToolbar>
    )
  }

}