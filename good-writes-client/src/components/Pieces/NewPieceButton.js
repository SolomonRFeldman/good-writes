import React, { useState } from 'react';
import Button from 'react-bootstrap/Button';
import NewPieceForm from './NewPieceForm';

export default function NewPieceButton(props) {
  const [showForm, setShowForm] = useState(false)

  const handleFormShow = () => setShowForm(true)
  const handleFormClose = () => setShowForm(false)

  return (
    <React.Fragment>
      <Button varient='primary' className={props.className} onClick={handleFormShow}>Add Piece</Button>
      <NewPieceForm show={showForm} handleClose={handleFormClose} />
    </React.Fragment>
  )

}