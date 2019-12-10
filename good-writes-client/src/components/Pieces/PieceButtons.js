import React from 'react';
import ButtonToolbar from 'react-bootstrap/ButtonToolbar';
import EditPieceButton from './EditPieceButton';

export default function PieceButton(props) {

  return(
    <ButtonToolbar className={props.className}>
      <EditPieceButton piece={props.piece} setPiece={props.setPiece} />
    </ButtonToolbar>
  )

}