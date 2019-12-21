import React from 'react';
import ModalButton from '../Modal/ModalButton';
import EditCommentForm from './EditCommentForm';

export default function EditCommentButton(props) {
  const modalProps = {comment: props.comment, collection: props.collection}

  return (
    <ModalButton Modal={EditCommentForm} modalProps={modalProps} variant={props.variant} className={props.className}>
      Edit
    </ModalButton>
  )

}

EditCommentButton.defaultProps = { variant: 'success' }