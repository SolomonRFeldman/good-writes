import React, { useState } from 'react';
import ModalButton from '../Modal/ModalButton';
import ButtonConfirmation from '../Modal/ButtonConfirmation';

export default function DeletePieceButton(props) {

  const action = () => {
    console.log("sup")
  }

  const modalProps = {action: action, children: 'Are you sure you want to delete this piece?'}

  return (
    <ModalButton Modal={ButtonConfirmation} modalProps={modalProps} variant={props.variant} className={props.className}>
      Delete
    </ModalButton>
  )

}

DeletePieceButton.defaultProps = { variant: 'danger' }