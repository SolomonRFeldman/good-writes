import React, { useState } from 'react';
import ModalButton from '../Modal/ModalButton';
import NewPieceForm from './NewPieceForm';

export default function NewPieceButton(props) {

  return (
    <ModalButton Modal={NewPieceForm} variant={props.variant} className={props.className}>Add Piece</ModalButton>
  )

}

NewPieceButton.defaultProps = { variant: 'primary' }