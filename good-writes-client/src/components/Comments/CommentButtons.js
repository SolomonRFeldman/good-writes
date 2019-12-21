import React from 'react';
import ButtonToolbar from 'react-bootstrap/ButtonToolbar';
import DeleteCommentButton from './DeleteCommentButton';
import EditCommentButton from './EditCommentButton';

export default function CommentButtons(props) {

  return(
    <ButtonToolbar className={props.className}>
      <EditCommentButton comment={props.comment} collection={props.collection} />
      <DeleteCommentButton className='ml-2' comment={props.comment} collection={props.collection} />
    </ButtonToolbar>
  )

}