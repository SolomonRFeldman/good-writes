import React from 'react';
import ButtonToolbar from 'react-bootstrap/ButtonToolbar';
import LogInButton from './LogInButton';
import SignUpButton from './SignUpButton';
import TestUserButton from './TestUserButton';

export default function LogInButtons(props) {

    return (
      <ButtonToolbar className={props.className}>
        <TestUserButton className='mr-sm-2' />
        <LogInButton className='mr-sm-2' />
        <SignUpButton />
      </ButtonToolbar>
    )

}