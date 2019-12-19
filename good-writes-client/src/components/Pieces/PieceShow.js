import React, { useState, useEffect } from 'react'
import Piece from './Piece'
import { withRouter } from 'react-router-dom';

function PieceShow(props) {

  const [piece, setPiece] = useState()
  useEffect( () => {
    const configObj = {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      }
    }
    if(localStorage.token) configObj.headers = { ...configObj.headers, "Token": localStorage.token }

    fetch(`/pieces/${props.match.params.id}`, configObj).then(response => response.json()).then(piece => {
      piece.status ? props.history.push('/') : setPiece(piece)
    })
  }, [])

  return(
    <Piece variant='show' piece={piece} />
  )

}

export default withRouter(PieceShow)