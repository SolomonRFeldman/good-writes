import React from 'react'
import Card from 'react-bootstrap/Card'
import { Link } from 'react-router-dom';


export default function Piece(props) {

  const header = <h1 className='display-4 d-inline-block'>{props.piece.title}</h1>
  const headerElement = () => {
    return props.variant === 'profile' ?
      <Link to={`/users/${props.piece.user_id}/pieces/${props.piece.id}`}>{header}</Link> :
      header
  }

  const formBody = () => { if(props.piece.form) { return `(${props.piece.form})` } }

  const bodyStyle = () => {
    if(props.variant === 'profile') return {overflow: 'hidden', whiteSpace: 'nowrap', textOverflow: 'ellipsis'}
  }
  
  return(
    <Card style={{width: '800px'}} className='mx-auto my-4'>
      <Card.Header>
        {headerElement()}
        <h3 className='d-inline-block ml-4'>{formBody()}</h3>
      </Card.Header>
      <Card.Body>
        <p style={bodyStyle()} className='mb-0'>{props.piece.content}</p>
      </Card.Body>
    </Card>
  )

}

Piece.defaultProps = { piece: {} }