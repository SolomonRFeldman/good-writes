import React from 'react';
import Modal from 'react-bootstrap/Modal';
import Button from 'react-bootstrap/Button';

export default function ButtonConfirmation(props) {

  const handleConfirm = () => {
    props.handleClose()
    props.action()
  }

  return(
    <Modal show={props.show} onHide={props.handleClose} centered>

      <Modal.Header closeButton>
        <Modal.Title>{props.children}</Modal.Title>
      </Modal.Header>

      <Modal.Footer>
        <Button variant='primary' onClick={handleConfirm}>Yes</Button>
        <Button variant='secondary' onClick={props.handleClose}>No</Button>
      </Modal.Footer>

    </Modal>
  )

}