import React from 'react'
import Piece from '../Pieces/Piece';

export default function FeaturedPiece(props) {

  return(
    <React.Fragment>
      <h2 className="text-center">{props.featured_piece.alias}'s Piece: </h2>
      <Piece variant={'group-show'} piece={props.featured_piece} />
    </React.Fragment>
  )

}