import React, { useState } from 'react';
import { withRouter } from 'react-router-dom';

import Modal from 'react-bootstrap/Modal';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';

import PieceForm from './PieceForm';

function NewPieceForm(props) {

  const [formData, setFormData] = useState()
  const [errors, setErrors] = useState()

  const handleSubmit = event => {
    event.preventDefault()
    const configObj = {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Token": localStorage.token
      },
      body: JSON.stringify({ piece: formData })
    }

    
    return fetch('/pieces', configObj).then(response => response.json()).then(piece => {
      piece.errors ? setErrors(piece.errors) : props.history.push(`/users/${piece.user_id}/pieces/${piece.id}`)
    })
  }

  return (
    <Modal size='lg' show={props.show} onHide={props.handleClose} centered>
      <Modal.Header closeButton>
        <Modal.Title>Add Your Piece</Modal.Title>
      </Modal.Header>

      <Form onSubmit={handleSubmit}>

        <Modal.Body>
          <PieceForm formData={formData} setFormData={setFormData} errors={errors} />
        </Modal.Body>

        <Modal.Footer>
          <Button type='submit' varient='primary'>Add Piece</Button>
        </Modal.Footer>

      </Form>
    </Modal>
  )

}

export default withRouter(NewPieceForm)