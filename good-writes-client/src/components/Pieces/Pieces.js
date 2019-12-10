import React, { useState, useEffect } from 'react'
import Piece from './Piece'

export default function Pieces(props) {
  const [pieces, setPieces] = useState(props.pieces)
  useEffect(() => setPieces(props.pieces), [props.pieces])
  
  return(
    <>{pieces.map(piece => <Piece key={piece.id} piece={piece} variant={props.variant} collection={{pieces, setPieces}} />)}</>
  )

}