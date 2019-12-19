import React from 'react';
import ModalButton from '../Modal/ModalButton';
import ButtonConfirmation from '../Modal/ButtonConfirmation';
import { withRouter } from 'react-router-dom';

function DeletePieceButton(props) {

  const action = () => {
    const configObj = {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Token": localStorage.token
      },
      body: JSON.stringify({ piece: props.piece })
    }

    return fetch(`/pieces/${props.piece.id}`, configObj).then(response => response.json()).then(piece => {
      if(props.collection) {
        props.collection.setPieces(props.collection.pieces.filter(collectionPiece => collectionPiece.id !== piece.id))
      } else {
        props.history.push(`/users/${piece.user_id}`)
      }
    })
  }

  const modalProps = {action: action, children: 'Are you sure you want to delete this piece?'}

  return (
    <ModalButton Modal={ButtonConfirmation} modalProps={modalProps} variant={props.variant} className={props.className}>
      Delete
    </ModalButton>
  )

}

DeletePieceButton.defaultProps = { variant: 'danger' }

export default withRouter(DeletePieceButton)