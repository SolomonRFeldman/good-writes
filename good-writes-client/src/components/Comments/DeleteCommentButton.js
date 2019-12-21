import React from 'react';
import ModalButton from '../Modal/ModalButton';
import ButtonConfirmation from '../Modal/ButtonConfirmation';
import { deleteRequest } from '../../fetchRequests';

export default function DeleteCommentButton(props) {
  const action = () => {
    return deleteRequest(`/comments/${props.comment.id}`).then(comment => {
      props.collection.setComments(props.collection.comments.filter(collectionComment => collectionComment.id !== comment.id))
    })
  }

  const modalProps = {action: action, children: 'Are you sure you want to delete this comment?'}

  return (
    <ModalButton Modal={ButtonConfirmation} modalProps={modalProps} variant={props.variant} className={props.className}>
      Delete
    </ModalButton>
  )

}

DeleteCommentButton.defaultProps = { variant: 'danger' }