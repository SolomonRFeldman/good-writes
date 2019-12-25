import React from 'react';
import ModalButton from '../Modal/ModalButton';
import ButtonConfirmation from '../Modal/ButtonConfirmation';
import { useHistory } from 'react-router-dom';
import { deleteRequest } from '../../fetchRequests';

export default function DeletePieceButton(props) {
  const history = useHistory()

  const action = () => {
    return deleteRequest(`/pieces/${props.piece.id}`).then(piece => {
      if(props.collection) {
        props.collection.setPieces(props.collection.pieces.filter(collectionPiece => collectionPiece.id !== piece.id))
      } else {
        history.replace(`/users/${piece.user_id}`)
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