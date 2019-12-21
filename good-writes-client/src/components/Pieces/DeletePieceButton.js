import React from 'react';
import ModalButton from '../Modal/ModalButton';
import ButtonConfirmation from '../Modal/ButtonConfirmation';
import { withRouter } from 'react-router-dom';
import { deleteRequest } from '../../fetchRequests';

function DeletePieceButton(props) {

  const action = () => {
    return deleteRequest(`/pieces/${props.piece.id}`).then(piece => {
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