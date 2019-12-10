import React, { useState, useEffect } from 'react'
import Piece from './Piece'

export default function PieceShow(props) {

  const [piece, setPiece] = useState()
  useEffect( () => {
    const configObj = {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Token": localStorage.token
      },
    }
    fetch(`/pieces/${props.match.params.id}`, configObj).then(response => response.json()).then(json => setPiece(json))
  }, [])

  return(
    <Piece variant='show' piece={piece} />
  )

}