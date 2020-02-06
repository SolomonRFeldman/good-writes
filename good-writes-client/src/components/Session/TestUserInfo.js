import React from 'react'
import { Modal, ListGroup } from 'react-bootstrap'

export default function TestUserInfo({show, handleClose}) {
  return(
    <Modal show={show} onHide={handleClose} centered>
      <Modal.Header closeButton>
        <Modal.Title>Login info for a test user</Modal.Title>
      </Modal.Header>

      <Modal.Body>
        <ListGroup className='w-100'>
          <ListGroup.Item>Email: Test@123.com</ListGroup.Item>
          <ListGroup.Item>Password: 123</ListGroup.Item>
        </ListGroup>
      </Modal.Body>
    </Modal>
  )
}