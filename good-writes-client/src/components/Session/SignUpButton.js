import React from 'react';
import Button from 'react-bootstrap/Button';

export default function SignUpButtonContainer(props) {

  return (
    <Button variant='secondary' className={props.className}>Sign Up</Button>
  )

}