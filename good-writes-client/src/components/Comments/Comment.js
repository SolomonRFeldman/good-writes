import React from 'react';
import Card from 'react-bootstrap/Card';
import { useSelector } from 'react-redux';
import CommentButtons from './CommentButtons';

export default function Comment(props) {
  const currentUser = useSelector(state => state.currentUser)
  const commentButtons = () => {
    if(currentUser.id === props.comment.user_id) { 
      return <CommentButtons comment={props.comment} collection={props.collection} className='float-right' />
    }
  }

  return(
    <Card style={{width: '800px'}} className='mx-auto my-4'>
      <Card.Header>
        <h2 className='d-inline-block mb-n5 mt-n1'>{props.comment.author_alias} said,</h2>
        {commentButtons()}
      </Card.Header>
      <Card.Body>
        <p className='mb-0 my-n2'>{props.comment.content}</p>
      </Card.Body>
    </Card>
  )

}