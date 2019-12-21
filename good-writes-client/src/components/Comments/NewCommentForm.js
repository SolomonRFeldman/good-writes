import React, { useState } from 'react'
import Form from 'react-bootstrap/Form'
import Button from 'react-bootstrap/Button'
import { postRequest } from '../../fetchRequests'

export default function NewCommentForm(props) {
  const [content, setContent] = useState()
  const handleChange = event => setContent(event.target.value)
  const [errors, setErrors] = useState({})

  const handleSubmit = event => {
    event.preventDefault()
    const body = { user_group: props.userGroup, comment: { content, piece_id: props.piece.id } }
    postRequest(`/comments`, body).then(comment => {
      if(comment.errors) {
        setErrors(comment.errors)
      } else {
        setContent('')
        setErrors({})
        props.setComments([...props.comments, comment])
      }
    })
  }

  return(
    <Form className='mx-auto' style={{width: '800px'}} onSubmit={handleSubmit}>
      <Form.Group>
        <Form.Control 
          onChange={handleChange}
          id='content' 
          as='textarea' 
          rows='3' 
          value={content} 
          isInvalid={errors.content} 
        />
        <Form.Control.Feedback type="invalid">{errors.content}</Form.Control.Feedback>
      </Form.Group>
      <div className='text-center'>
        <Button type='submit' className='mx-auto'>Add Comment</Button>
      </div>
    </Form>
  )

}