import React from 'react'
import Form from 'react-bootstrap/Form'
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';

export default function PieceForm(props) {

  const handleChange = event => props.setFormData({ ...props.formData, [event.target.id]: event.target.value })

  return(
    <React.Fragment>
      <Form.Group as={Row} >
        <Form.Label className='ml-3' column sm={0}>Title</Form.Label>
        <Col>
          <Form.Control id='title' onChange={handleChange} type='text' placeholder='Title' value={props.formData.title} />
        </Col>
        <Form.Label column sm={0}>Form</Form.Label>
        <Col>
          <Form.Control id='form' onChange={handleChange} as='select' value={props.formData.form}>
            <option>Poetry</option>
            <option>Fiction</option>
            <option>Non-Fiction</option>
          </Form.Control>
        </Col>
      </Form.Group>
      <Form.Group >
        <Form.Label>Content</Form.Label>
        <Form.Control id='content' onChange={handleChange} as='textarea' rows='18' value={props.formData.content} />
      </Form.Group>
    </React.Fragment>
  )

}

PieceForm.defaultProps = { formData: { title: '', form: 'Poetry', content: '' } }