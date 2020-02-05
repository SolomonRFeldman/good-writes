import React, { useState, useEffect } from 'react';
import './Piece.css'
import Card from 'react-bootstrap/Card';
import { Link } from 'react-router-dom';
import PieceButtons from './PieceButtons';
import { useSelector } from 'react-redux';


export default function Piece(props) {

  const currentUser = useSelector(state => state.currentUser)

  const [piece, setPiece] = useState(props.piece)
  useEffect(() => setPiece(props.piece), [props.piece])

  const header = <h1 className='text display-4 d-inline-block'>{piece.title}</h1>
  const headerElement = () => {
    return props.variant === 'profile' ?
      <Link to={`/users/${piece.user_id}/pieces/${piece.id}`}>{header}</Link> :
      header
  }

  const formBody = () => { if(piece.form) { return `(${piece.form})` } }
  const headerButtons = () => {
    if((props.variant === 'profile' || props.variant === 'show') && (currentUser.id === piece.user_id)) {
      return <PieceButtons className='float-right' {...{piece, setPiece}} collection={props.collection} /> 
    }
  }

  const bodyContent = () => props.variant === 'profile' ? props.piece.content.replace(/\n/g, ' / ') : props.piece.content

  return(
    <Card className={`piece ${props.variant} mx-auto my-4`}>
      <Card.Header className='header'>
        {headerElement()}
        <h3 className='form-label d-inline-block ml-4'>{formBody()}</h3>
        {headerButtons()}
      </Card.Header>
      <Card.Body className='body'>
        <p className='text mb-0'>{bodyContent()}</p>
      </Card.Body>
    </Card>
  )

}

Piece.defaultProps = { piece: {} }