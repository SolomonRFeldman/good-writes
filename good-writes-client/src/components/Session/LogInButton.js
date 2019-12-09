import React, { useState } from 'react';
import Button from 'react-bootstrap/Button';
import LogInForm from './LogInForm';

export default function LogInButton(props) {
  const [showForm, setShowForm] = useState(false)

  const handleFormShow = () => setShowForm(true)
  const handleFormClose = () => setShowForm(false)

  return (
    <>
      <Button varient='primary' className={props.className} onClick={handleFormShow}>Log In</Button>
      <LogInForm show={showForm} handleClose={handleFormClose} />
    </>
  )

}