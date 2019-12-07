import React, { useState } from 'react';
import Button from 'react-bootstrap/Button';
import SignUpForm from './SignUpForm';

export default function SignUpButtonContainer(props) {
  const [showForm, setShowForm] = useState(false)

  const handleFormShow = () => setShowForm(true)
  const handleFormClose = () => setShowForm(false)

  return (
    <React.Fragment>
      <Button variant='secondary' className={props.className} onClick={handleFormShow}>Sign Up</Button>
      <SignUpForm show={showForm} handleClose={handleFormClose} />
    </React.Fragment>
  )

}