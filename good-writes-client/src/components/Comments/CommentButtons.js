import React from 'react';
import ButtonToolbar from 'react-bootstrap/ButtonToolbar';
import Button from 'react-bootstrap/Button';

export default function CommentButtons(props) {

  return(
    <ButtonToolbar className={props.className}>
      <Button>Edit</Button>
      <Button>Delete</Button>
    </ButtonToolbar>
  )

}