import React from 'react';
import ButtonToolbar from 'react-bootstrap/ButtonToolbar';
import Button from 'react-bootstrap/Button';
import DeleteCommentButton from './DeleteCommentButton';

export default function CommentButtons(props) {

  return(
    <ButtonToolbar className={props.className}>
      <Button>Edit</Button>
      <DeleteCommentButton className='ml-2' comment={props.comment} collection={props.collection} />
    </ButtonToolbar>
  )

}