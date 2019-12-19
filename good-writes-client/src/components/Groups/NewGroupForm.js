import React, { useState } from 'react';
import { connect } from 'react-redux';

import Modal from 'react-bootstrap/Modal';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';

function NewGroupForm(props) {

  const [formData, setFormData] = useState({form: 'Poetry'})
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
      body: JSON.stringify({ group: formData })
    }
    if(localStorage.token) configObj.headers = { ...configObj.headers, "Token": localStorage.token }
    
    return fetch('/groups', configObj).then(response => response.json()).then(group => {
      console.log(group)
      group.errors ? setErrors(group.errors) : props.triggerRedirect(`/groups/${group.id}`)
    })
  }

  return (
    <Modal size='sm' show={props.show} onHide={props.handleClose} centered>

      <Modal.Header closeButton>
        <Modal.Title>Create Your Group</Modal.Title>
      </Modal.Header>

      <Form onSubmit={handleSubmit}>

        <Modal.Body>
            <Form.Group >
              <Form.Label>Name</Form.Label>
              <Form.Control id='name' onChange={handleChange} type='text' placeholder='Name' isInvalid={errors.name} />
              <Form.Control.Feedback type="invalid">{errors.name}</Form.Control.Feedback>
            </Form.Group>
            <Form.Group >
              <Form.Label>Form</Form.Label>
              <Form.Control id='form' onChange={handleChange} as='select' isInvalid={errors.form}>
                <option>Poetry</option>
                <option>Fiction</option>
                <option>Non-Fiction</option>
              </Form.Control>
              <Form.Control.Feedback type="invalid">{errors.form}</Form.Control.Feedback>
            </Form.Group>
            <Form.Group >
              <Form.Label>Alias</Form.Label>
              <Form.Control id='alias' onChange={handleChange} type='text' placeholder='Alias' isInvalid={errors.alias}/>
              <Form.Control.Feedback type="invalid">{errors.alias}</Form.Control.Feedback>
            </Form.Group>
        </Modal.Body>

        <Modal.Footer>
          <Button type='submit' varient='primary'>Create</Button>
        </Modal.Footer>

      </Form>

    </Modal>
  )

}

const mapDispatchToProps = dispatch => ({ 
  triggerRedirect: path => { dispatch({ type: 'TRIGGER_REDIRECT', path }) }
})

export default connect(null, mapDispatchToProps)(NewGroupForm)