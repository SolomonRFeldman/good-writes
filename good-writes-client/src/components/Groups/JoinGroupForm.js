import React, { useState } from 'react';
import Modal from 'react-bootstrap/Modal';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';
import { withRouter } from 'react-router-dom';

function JoinGroupForm(props) {

  const [formData, setFormData] = useState({ alias: '' })
  const handleChange = event => setFormData({ ...formData, [event.target.id]: event.target.value })

  const handleSubmit = event => {
    event.preventDefault()
    const configObj = {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify({ user_group: {...formData }, group_id: props.group.id })
    }
    if(localStorage.token) configObj.headers = { ...configObj.headers, "Token": localStorage.token }

    return fetch(`/user_groups`, configObj).then(response => response.json()).then(userGroup => {
      props.history.push(`/groups/${userGroup.group_id}`)
    })
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

export default withRouter(JoinGroupForm)