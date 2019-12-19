import React, { useState } from 'react';
import Modal from 'react-bootstrap/Modal';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';
import { connect } from 'react-redux';

function LogInForm(props) {

  const [formData, setFormData] = useState({ email: '', password: '' })
  const handleChange = event => setFormData({ ...formData, [event.target.id]: event.target.value })
  const [error, setError] = useState(false)

  const handleShow = () => {
    setError(false)
    setFormData({})
  }

  const handleSubmit = event => {
    event.preventDefault()
    const configObj = {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify({ user: formData })
    }

    
    return fetch('/login', configObj).then(response => response.json()).then(user => {
      if(user.error) {
        setError(user.error)
      } else {
        props.addCurrentUser(user)
        localStorage.token = user.token
      }
    })
  }

  return (
    <Modal show={props.show} onHide={props.handleClose} onShow={handleShow} centered>

      <Modal.Header closeButton>
        <Modal.Title>Log in with your email and password.</Modal.Title>
      </Modal.Header>

      <Form onSubmit={handleSubmit}>

        <Modal.Body>
            <Form.Group >
              <Form.Label>Email</Form.Label>
              <Form.Control id='email' onChange={handleChange} type='email' placeholder='Email' isInvalid={error} />
              <Form.Control.Feedback type="invalid">Invalid Email or Password</Form.Control.Feedback>
            </Form.Group>
            <Form.Group >
              <Form.Label>Password</Form.Label>
              <Form.Control id='password' onChange={handleChange} type='password' placeholder='Password' isInvalid={error} />
            </Form.Group>
        </Modal.Body>

        <Modal.Footer>
          <Button type='submit' varient='primary'>Log In</Button>
        </Modal.Footer>

      </Form>
    </Modal>
  )

}

const mapDispatchToProps = dispatch => ({ addCurrentUser: payload => { dispatch({ type: "ADD_CURRENT_USER", payload }) } })

export default connect(null, mapDispatchToProps)(LogInForm)