import React, { useState, useEffect } from 'react';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';
import { patchRequest } from '../../fetchRequests';

export default function SelectPiece(props) {
  const [pieceId, setPieceId] = useState()
  useEffect(() => setPieceId(props.userGroup.piece_id), [props.userGroup.piece_id])

  const handleChange = event => setPieceId(event.target.value)

  const handleSubmit = event => {
    event.preventDefault()
    const body = { user_group: {piece_id: pieceId} }
    patchRequest(`/user_groups/${props.userGroup.id}`, body).then(json => {
      if(props.userGroup.id === props.group.featured_piece.user_group_id) { 
        const featured_piece = {...json.piece, user_group_id: props.userGroup.id, alias: props.userGroup.alias}
        props.setGroup({...props.group, featured_piece: featured_piece})
      }
    })
  }

  const isFeatured = () => props.group.featured_piece.id && (props.group.featured_piece.user_group_id === props.userGroup.id)

  return(
    <Form onSubmit={handleSubmit}>
      <Form.Label className='text-white'>Selected Piece: </Form.Label>
      <Form.Control className='mb-2' onChange={handleChange} as='select' value={pieceId} disabled={isFeatured()}>
        <option value='null' selected disabled hidden></option>
        {props.userGroup.valid_pieces.map(piece => <option key={piece.id} value={piece.id}>{piece.title}</option>)}
      </Form.Control>
      <Button type='submit' varient='primary'>Change Piece</Button>
    </Form>
  )

}