import React, { useState, useEffect } from 'react'
import Piece from './Piece'
import { withRouter } from 'react-router-dom';
import { getRequest } from '../../fetchRequests';

function PieceShow(props) {

  const [piece, setPiece] = useState()
  useEffect( () => {
    getRequest(`/pieces/${props.match.params.id}`).then(piece => {
      piece.status ? props.history.push('/') : setPiece(piece)
    })
  }, [props.match.params.id])

  return(
    <Piece variant='show' piece={piece} />
  )

}

export default withRouter(PieceShow)