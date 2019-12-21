import React, { useState } from 'react';

import Modal from 'react-bootstrap/Modal';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';
import { patchRequest } from '../../fetchRequests';

export default function EditCommentForm(props) {
  const [content, setContent] = useState(props.comment.content)
  const handleChange = event => setContent(event.target.value)
  const [errors, setErrors] = useState({})
  
  const handleShow = () => {
    setErrors({})
    setContent(props.comment.content)
  }

  const handleSubmit = event => {
    event.preventDefault()
    
    const body = { content: content }
    return patchRequest(`/comments/${props.comment.id}`, body).then(comment => {
      if(comment.errors) {
        setErrors(comment.errors)
      } else {
        props.collection.setComments(props.collection.comments.map(colComment => colComment.id === comment.id ? comment : colComment))
        props.handleClose()
      }
    })
  }

  return (
    <Modal size='lg' show={props.show} onHide={props.handleClose} onShow={handleShow} centered>
      <Modal.Header closeButton>
        <Modal.Title>Edit Your Comment</Modal.Title>
      </Modal.Header>

      <Form onSubmit={handleSubmit}>

        <Modal.Body>
          <Form.Control onChange={handleChange} id='content' as='textarea' rows='3' value={content} isInvalid={errors.content} />
          <Form.Control.Feedback type="invalid">{errors.content}</Form.Control.Feedback>
        </Modal.Body>

        <Modal.Footer>
          <Button type='submit' varient='primary'>Update</Button>
        </Modal.Footer>

      </Form>
    </Modal>
  )

}
