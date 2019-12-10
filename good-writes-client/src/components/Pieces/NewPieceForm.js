import React, { useState } from 'react';
import Modal from 'react-bootstrap/Modal';
import Form from 'react-bootstrap/Form';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Button from 'react-bootstrap/Button';

export default function NewPieceForm(props) {

  const [formData, setFormData] = useState({ title: '', form: 'Poetry', content: '' })
  const handleChange = event => setFormData({ ...formData, [event.target.id]: event.target.value })

  const handleSubmit = () => {}

  return (
    <Modal size='lg' show={props.show} onHide={props.handleClose} centered>
      <Modal.Header closeButton>
        <Modal.Title>Add Your Piece</Modal.Title>
      </Modal.Header>

      <Form onSubmit={handleSubmit}>

        <Modal.Body>
            <Form.Group as={Row} >
              <Form.Label className='ml-3' column sm={0}>Title</Form.Label>
              <Col>
                <Form.Control id='title' onChange={handleChange} type='text' placeholder='Title' value={formData.title} />
              </Col>
              <Form.Label column sm={0}>Form</Form.Label>
              <Col>
                <Form.Control id='form' onChange={handleChange} as='select' value={formData.form}>
                  <option>Poetry</option>
                  <option>Fiction</option>
                  <option>Non-Fiction</option>
                </Form.Control>
              </Col>
            </Form.Group>
            <Form.Group >
              <Form.Label>Content</Form.Label>
              <Form.Control id='content' onChange={handleChange} as='textarea' rows='18' value={formData.content} />
            </Form.Group>
        </Modal.Body>

        <Modal.Footer>
          <Button type='submit' varient='primary'>Log In</Button>
        </Modal.Footer>

      </Form>
    </Modal>
  )

}