import React from 'react';
import ButtonToolbar from 'react-bootstrap/ButtonToolbar';
import EditPieceButton from './EditPieceButton';
import DeletePieceButton from './DeletePieceButton';

export default function PieceButton(props) {

  return(
    <ButtonToolbar className={props.className}>
      <EditPieceButton piece={props.piece} setPiece={props.setPiece} />
      <DeletePieceButton className='ml-2' piece={props.piece} />
    </ButtonToolbar>
  )

}