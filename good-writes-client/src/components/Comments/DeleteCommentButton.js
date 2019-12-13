import React from 'react';
import ModalButton from '../Modal/ModalButton';
import ButtonConfirmation from '../Modal/ButtonConfirmation';

export default function DeleteCommentButton(props) {
  const action = () => {
    const configObj = {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify({ comment: props.comment })
    }
    if(localStorage.token) configObj.headers = { ...configObj.headers, "Token": localStorage.token }

    return fetch(`/comments/${props.comment.id}`, configObj).then(response => response.json()).then(comment => {
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