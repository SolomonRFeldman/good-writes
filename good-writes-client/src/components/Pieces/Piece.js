import React, { useState, useEffect } from 'react';
import Card from 'react-bootstrap/Card';
import { Link } from 'react-router-dom';
import PieceButtons from './PieceButtons';
import { connect } from 'react-redux';


function Piece(props) {
  const [piece, setPiece] = useState(props.piece)
  useEffect(() => setPiece(props.piece), [props.piece])

  const header = <h1 className='display-4 d-inline-block'>{piece.title}</h1>
  const headerElement = () => {
    return props.variant === 'profile' ?
      <Link to={`/users/${piece.user_id}/pieces/${piece.id}`}>{header}</Link> :
      header
  }

  const formBody = () => { if(piece.form) { return `(${piece.form})` } }
  const headerButtons = () => {
    if((props.variant === 'profile' || props.variant === 'show') && (props.currentUser.id === piece.user_id)) {
      return <PieceButtons className='float-right' {...{piece, setPiece}} collection={props.collection} /> 
    }
  }


  const bodyStyle = () => {
    if(props.variant === 'profile') return {overflow: 'hidden', whiteSpace: 'nowrap', textOverflow: 'ellipsis'}
  }
  
  return(
    <Card style={{width: '800px'}} className='mx-auto my-4'>
      <Card.Header>
        {headerElement()}
        <h3 className='d-inline-block ml-4'>{formBody()}</h3>
        {headerButtons()}
      </Card.Header>
      <Card.Body>
        <p style={bodyStyle()} className='mb-0'>{piece.content}</p>
      </Card.Body>
    </Card>
  )

}

Piece.defaultProps = { piece: {} }

const mapStateToProps = ({ currentUser }) => ({ currentUser })
export default connect(mapStateToProps, null)(Piece)