import React from 'react'
import Piece from './Piece'

export default function Pieces(props) {
  
  return(
    <>{props.pieces.map(piece => <Piece key={piece.id} piece={piece} varient={props.varient} />)}</>
  )

}