import React, { useState } from 'react';
import Modal from 'react-bootstrap/Modal';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';
import { connect } from 'react-redux';

function SignUpForm(props) {

  const [formData, setFormData] = useState({ username: '', email: '', password: '', password_confirmation: '' })
  const handleChange = event => setFormData({ ...formData, [event.target.id]: event.target.value })
  const [errors, setErrors] = useState({})

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

    
    return fetch('/signup', configObj).then(response => response.json()).then(user => {
      if(user.errors) {
        setErrors(user.errors)
      } else {
        props.addCurrentUser(user)
        localStorage.token = user.token
      }
    })
  }

  return (
    <Modal show={props.show} onHide={props.handleClose} centered>

      <Modal.Header closeButton>
        <Modal.Title>Sign up</Modal.Title>
      </Modal.Header>

      <Form onSubmit={handleSubmit}>

        <Modal.Body>
            <Form.Group >
              <Form.Label>Username</Form.Label>
              <Form.Control 
                id='username' 
                onChange={handleChange} 
                type='text' 
                placeholder='Username' 
                isInvalid={errors.username}
              />
              <Form.Control.Feedback type="invalid">{errors.username}</Form.Control.Feedback>
            </Form.Group>

            <Form.Group >
              <Form.Label>Email</Form.Label>
              <Form.Control id='email' onChange={handleChange} type='email' placeholder='Email' isInvalid={errors.email}/>
              <Form.Control.Feedback type="invalid">{errors.email}</Form.Control.Feedback>
            </Form.Group>

            <Form.Group >
              <Form.Label>Password</Form.Label>
              <Form.Control 
                id='password' 
                onChange={handleChange} 
                type='password' 
                placeholder='Password' 
                isInvalid={errors.password}
              />
              <Form.Control.Feedback type="invalid">{errors.password}</Form.Control.Feedback>
            </Form.Group>

            <Form.Group >
              <Form.Label>Confirm Password</Form.Label>
              <Form.Control 
                id='password_confirmation' 
                onChange={handleChange} 
                type='password' 
                placeholder='Confirm Password'
                isInvalid={errors.password_confirmation}
              />
              <Form.Control.Feedback type="invalid">{errors.password_confirmation}</Form.Control.Feedback>
            </Form.Group>
        </Modal.Body>

        <Modal.Footer>
          <Button type='submit' varient='primary'>Sign Up</Button>
        </Modal.Footer>

      </Form>
    </Modal>
  )

}

const mapDispatchToProps = dispatch => ({ addCurrentUser: payload => { dispatch({ type: "ADD_CURRENT_USER", payload }) } })

export default connect(null, mapDispatchToProps)(SignUpForm)