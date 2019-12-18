import React, { useEffect } from 'react'
import Form from 'react-bootstrap/Form'
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';

export default function PieceForm(props) {

  useEffect(() => props.setFormData(props.formData), [])
  const handleChange = event => props.setFormData({ ...props.formData, [event.target.id]: event.target.value })

  return(
    <React.Fragment>
      <Form.Group as={Row} >
        <Form.Label className='ml-3' column sm={0}>Title</Form.Label>
        <Col>
          <Form.Control 
            id='title' 
            onChange={handleChange} 
            type='text' 
            placeholder='Title' 
            value={props.formData.title} 
            isInvalid={props.errors.title} 
          />
          <Form.Control.Feedback type="invalid">{props.errors.title}</Form.Control.Feedback>
        </Col>
        <Form.Label column sm={0}>Form</Form.Label>
        <Col>
          <Form.Control id='form' onChange={handleChange} as='select' value={props.formData.form} isInvalid={props.errors.form}>
            <option>Poetry</option>
            <option>Fiction</option>
            <option>Non-Fiction</option>
          </Form.Control>
          <Form.Control.Feedback type="invalid">{props.errors.form}</Form.Control.Feedback>
        </Col>
      </Form.Group>
      <Form.Group >
        <Form.Label>Content</Form.Label>
        <Form.Control 
          id='content' 
          onChange={handleChange} 
          as='textarea' 
          rows='18' 
          value={props.formData.content} 
          isInvalid={props.errors.content}
        />
        <Form.Control.Feedback type="invalid">{props.errors.content}</Form.Control.Feedback>
      </Form.Group>
    </React.Fragment>
  )

}

PieceForm.defaultProps = { formData: { title: '', form: 'Poetry', content: '' }, errors: {} }