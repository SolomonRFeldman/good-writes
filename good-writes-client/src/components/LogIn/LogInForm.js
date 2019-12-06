import React, { useState } from 'react';
import Modal from 'react-bootstrap/Modal';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';
import { connect } from 'react-redux';

function LogInForm(props) {

  const [formData, setFormData] = useState({ email: '', password: '' })
  const handleChange = event => setFormData({ ...formData, [event.target.id]: event.target.value })

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

    
    return fetch('/login', configObj).then(response => response.json()).then(json => {
      props.addToken(json.token)
      localStorage.token = json.token
    })
  }

  return (
    <Modal show={props.show} onHide={props.handleClose} centered>

      <Modal.Header closeButton>
        <Modal.Title>Log in with your email and password.</Modal.Title>
      </Modal.Header>

      <Form onSubmit={handleSubmit}>

        <Modal.Body>
            <Form.Group >
              <Form.Label>Email</Form.Label>
              <Form.Control id='email' onChange={handleChange} type='email' placeholder='Email' />
            </Form.Group>
            <Form.Group >
              <Form.Label>Password</Form.Label>
              <Form.Control id='password' onChange={handleChange} type='password' placeholder='Password' />
            </Form.Group>
        </Modal.Body>

        <Modal.Footer>
          <Button type='submit' varient='primary'>Log In</Button>
        </Modal.Footer>

      </Form>
    </Modal>
  )

}

const mapStateToProps = ({ token }) => ({ token })

const mapDispatchToProps = dispatch => ({
  addToken: token => { dispatch({ type: "ADD_TOKEN", token }) }
})

export default connect(mapStateToProps, mapDispatchToProps)(LogInForm)