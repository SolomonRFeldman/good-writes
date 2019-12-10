import React, { useState } from 'react';
import Button from 'react-bootstrap/Button';

export default function ModalButton(props) {
  const [showForm, setShowForm] = useState(false)

  const handleFormShow = () => setShowForm(true)
  const handleFormClose = () => setShowForm(false)

  console.log(props)

  return (
    <React.Fragment>
      <Button variant={props.variant} className={props.className} onClick={handleFormShow}>{props.children}</Button>
      <props.Modal show={showForm} handleClose={handleFormClose} />
    </React.Fragment>
  )

}