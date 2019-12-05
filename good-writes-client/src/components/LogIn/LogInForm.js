import React, { Component } from 'react';
import Modal from 'react-bootstrap/Modal';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button'

export default class LogInForm extends Component {

  render() {
    return (
      <Modal show={this.props.show} onHide={this.props.handleClose} centered>

        <Modal.Header closeButton>
          <Modal.Title>Log in with your email and password.</Modal.Title>
        </Modal.Header>

        <Form>

          <Modal.Body>
              <Form.Group controlId='logInEmail'>
                <Form.Label>Email</Form.Label>
                <Form.Control type='email' placeholder='Email' />
              </Form.Group>
              <Form.Group controlId='logInPassword'>
                <Form.Label>Password</Form.Label>
                <Form.Control type='password' placeholder='Password' />
              </Form.Group>
          </Modal.Body>

          <Modal.Footer>
            <Button varient='primary'>Log In</Button>
          </Modal.Footer>

        </Form>
      </Modal>
    )
  }

}