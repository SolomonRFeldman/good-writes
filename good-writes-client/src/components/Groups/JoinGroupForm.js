import React, { useState } from 'react';
import Modal from 'react-bootstrap/Modal';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';

export default function JoinGroupForm(props) {

  const [formData, setFormData] = useState({ alias: '' })
  const handleChange = event => setFormData({ ...formData, [event.target.id]: event.target.value })

  const handleSubmit = event => {
    event.preventDefault()
  }

  return(
    <Modal show={props.show} onHide={props.handleClose} centered>
      <Modal.Header closeButton>Choose an alias for {props.group.name}?</Modal.Header>

      <Form onSubmit={handleSubmit}>

        <Modal.Body>
          <Form.Label>Alias</Form.Label>
          <Form.Control id='alias' onChange={handleChange} type='text' placeholder='Alias' />
        </Modal.Body>

        <Modal.Footer>
          <Button type='submit' variant='success'>Join</Button>
        </Modal.Footer>

      </Form>
    </Modal>
  )

}