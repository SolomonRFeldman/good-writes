import React from 'react';
import ModalButton from '../Modal/ModalButton';
import EditPieceForm from './EditPieceForm';

export default function EditPieceButton(props) {
  const modalProps = {piece: props.piece, setPiece: props.setPiece}

  return (
    <ModalButton Modal={EditPieceForm} modalProps={modalProps} variant={props.variant} className={props.className}>
      Edit
    </ModalButton>
  )

}

EditPieceButton.defaultProps = { variant: 'success' }