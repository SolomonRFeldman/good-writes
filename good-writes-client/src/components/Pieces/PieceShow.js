import React, { useState, useEffect } from 'react'
import Piece from './Piece'
import { useHistory } from 'react-router-dom';
import { getRequest } from '../../fetchRequests';

export default function PieceShow(props) {
  const history = useHistory()

  const [piece, setPiece] = useState()
  useEffect( () => {
    getRequest(`/pieces/${props.match.params.id}`).then(piece => {
      piece.status ? history.replace('/') : setPiece(piece)
    })
  }, [props.match.params.id])

  return(
    <Piece variant='show' piece={piece} />
  )

}