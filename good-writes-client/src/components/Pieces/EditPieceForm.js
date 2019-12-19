import React, { useState } from 'react';
import { connect } from 'react-redux';

import Modal from 'react-bootstrap/Modal';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';

import PieceForm from './PieceForm';

function EditPieceForm(props) {
  const [formData, setFormData] = useState(props.piece)
  const [errors, setErrors] = useState()

  const handleSubmit = event => {
    event.preventDefault()
    const configObj = {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Token": localStorage.token
      },
      body: JSON.stringify({ piece: formData })
    }

    return fetch(`/pieces/${props.piece.id}`, configObj).then(response => response.json()).then(piece => {
      if(piece.errors) {
        setErrors(piece.errors)
      } else {
        const piecePath = `/users/${piece.user_id}/pieces/${piece.id}`
        if(window.location.pathname === piecePath) {
          props.setPiece(piece)
          setErrors({})
          props.handleClose()
        } else {
          props.triggerRedirect(`/users/${piece.user_id}/pieces/${piece.id}`)
        }
      }
    })
  }

  return (
    <Modal size='lg' show={props.show} onHide={props.handleClose} centered>
      <Modal.Header closeButton>
        <Modal.Title>Edit Your Piece</Modal.Title>
      </Modal.Header>

      <Form onSubmit={handleSubmit}>

        <Modal.Body>
          <PieceForm formData={formData} setFormData={setFormData} errors={errors}/>
        </Modal.Body>

        <Modal.Footer>
          <Button type='submit' varient='primary'>Update</Button>
        </Modal.Footer>

      </Form>
    </Modal>
  )

}

const mapDispatchToProps = dispatch => ({ 
  triggerRedirect: path => { dispatch({ type: 'TRIGGER_REDIRECT', path }) }
})

export default connect(null, mapDispatchToProps)(EditPieceForm)