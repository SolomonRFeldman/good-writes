import React, { useState } from 'react'
import Form from 'react-bootstrap/Form'
import Button from 'react-bootstrap/Button'

export default function NewCommentForm(props) {
  const [content, setContent] = useState()
  const handleChange = event => setContent(event.target.value)
  const [errors, setErrors] = useState({})

  const handleSubmit = event => {
    event.preventDefault()
    const configObj = {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify({ user_group: props.userGroup, comment: {content, piece_id: props.piece.id}})
    }
    if(localStorage.token) configObj.headers = { ...configObj.headers, "Token": localStorage.token }

    fetch(`/comments`, configObj).then(response => response.json()).then(comment => {
      if(comment.errors) {
        setErrors(comment.errors)
      } else {
        setContent('')
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