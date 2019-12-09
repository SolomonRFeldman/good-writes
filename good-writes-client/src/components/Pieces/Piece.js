import React from 'react'
import Card from 'react-bootstrap/Card'

export default function Piece(props) {

  const bodyStyle = () => {
    if(props.varient === 'profile') return {overflow: 'hidden', whiteSpace: 'nowrap', textOverflow: 'ellipsis'}
  }
  
  return(
    <Card style={{width: '800px'}} className='mx-auto my-4'>
      <Card.Header>
        <h1 className='display-4 d-inline-block'>{props.piece.title}</h1>
        <h3 className='d-inline-block ml-4'>({props.piece.form})</h3>
      </Card.Header>
      <Card.Body>
        <p style={bodyStyle()} className='mb-0'>{props.piece.content}</p>
      </Card.Body>
    </Card>
  )

}