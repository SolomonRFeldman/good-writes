import React from 'react';
import ButtonToolbar from 'react-bootstrap/ButtonToolbar';
import LogInButton from './LogInButton';
import SignUpButton from './SignUpButton';

export default function LogInButtons(props) {

    return (
      <ButtonToolbar className='ml-auto'>
        <LogInButton className='mr-sm-2' />
        <SignUpButton />
      </ButtonToolbar>
    )

}