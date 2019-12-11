import React, { useState, useEffect } from 'react'
import Piece from './Piece'

export default function Pieces(props) {
  const [pieces, setPieces] = useState(props.pieces)
  useEffect(() => setPieces(props.pieces), [props.pieces])

  const filteredPieces = () => props.formFilter ? pieces.filter(piece => piece.form === props.formFilter) : pieces
  
  return(
    <>{filteredPieces().map(piece => <Piece key={piece.id} piece={piece} variant={props.variant} collection={{pieces, setPieces}} />)}</>
  )

}