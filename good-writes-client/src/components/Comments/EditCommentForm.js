import React, { useState, useEffect } from 'react';

import Modal from 'react-bootstrap/Modal';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';

export default function EditCommentForm(props) {
  const [content, setContent] = useState(props.comment.content)
  const handleChange = event => setContent(event.target.value)
  const [errors, setErrors] = useState({})
  useEffect(() => { if(props.show) {
    setErrors({})
    setContent(props.comment.content)
  }}, [props.show])

  const handleSubmit = event => {
    event.preventDefault()
    const configObj = {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify({ content: content })
    }
    if(localStorage.token) configObj.headers = { ...configObj.headers, "Token": localStorage.token }

    return fetch(`/comments/${props.comment.id}`, configObj).then(response => response.json()).then(comment => {
      if(comment.errors) {
        setErrors(comment.errors)
      } else {
        props.setComment(comment)
        props.handleClose()
      }
    })
  }

  return (
    <Modal size='lg' show={props.show} onHide={props.handleClose} centered>
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
