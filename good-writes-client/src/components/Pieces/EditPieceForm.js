import React, { useState } from 'react';
import { useHistory } from 'react-router-dom';

import Modal from 'react-bootstrap/Modal';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';

import PieceForm from './PieceForm';
import { patchRequest } from '../../fetchRequests';

export default function EditPieceForm(props) {
  const history = useHistory()

  const [formData, setFormData] = useState(props.piece)
  const [errors, setErrors] = useState()

  const handleSubmit = event => {
    event.preventDefault()

    const body = { piece: formData }
    return patchRequest(`/pieces/${props.piece.id}`, body).then(piece => {
      if(piece.errors) {
        setErrors(piece.errors)
      } else {
        const piecePath = `/users/${piece.user_id}/pieces/${piece.id}`
        if(window.location.pathname === piecePath) {
          props.setPiece(piece)
          setErrors({})
          props.handleClose()
        } else {
          history.push(`/users/${piece.user_id}/pieces/${piece.id}`)
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