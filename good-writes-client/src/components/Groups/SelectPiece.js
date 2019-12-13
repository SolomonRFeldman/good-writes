import React, { useState, useEffect } from 'react';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';

export default function SelectPiece(props) {
  const [pieceId, setPieceId] = useState()
  useEffect(() => setPieceId(props.userGroup.piece_id), [props.userGroup.piece_id])

  const handleChange = event => setPieceId(event.target.value)

  const handleSubmit = event => {
    event.preventDefault()
    if(pieceId) {
      const configObj = {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: JSON.stringify({ user_group: {piece_id: pieceId} })
      }
      if(localStorage.token) configObj.headers = { ...configObj.headers, "Token": localStorage.token }
    
      fetch(`/user_groups/${props.userGroup.id}`, configObj).then(response => response.json()).then(json => {
        if(props.userGroup.id === props.group.featured_piece.user_group_id) { 
          const featured_piece = {...json.piece, user_group_id: props.userGroup.id, alias: props.userGroup.alias}
          props.setGroup({...props.group, featured_piece: featured_piece})
        }
      })
    }
  }

  return(
    <Form onSubmit={handleSubmit}>
      <Form.Label className='text-white'>Selected Piece: </Form.Label>
      <Form.Control onChange={handleChange} as='select' value={pieceId}>
        <option value='null' selected disabled hidden>Select A Piece...</option>
        {props.userGroup.valid_pieces.map(piece => <option key={piece.id} value={piece.id}>{piece.title}</option>)}
      </Form.Control>
      <Button type='submit' varient='primary'>Change Piece</Button>
    </Form>
  )

}