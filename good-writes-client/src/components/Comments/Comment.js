import React, { useState, useEffect } from 'react';
import Card from 'react-bootstrap/Card';
import { connect } from 'react-redux';
import CommentButtons from './CommentButtons';

function Comment(props) {
  const [comment, setComment] = useState(props.comment)
  useEffect(() => setComment(props.comment), [props.comment])

  const commentButtons = () => {
    if(props.currentUser.id === comment.user_id) { 
      return <CommentButtons comment={comment} setComment={setComment} collection={props.collection} className='float-right' />
    }
  }

  return(
    <Card style={{width: '800px'}} className='mx-auto my-4'>
      <Card.Header>
        <h2 className='d-inline-block mb-n5 mt-n1'>{comment.author_alias} said,</h2>
        {commentButtons()}
      </Card.Header>
      <Card.Body>
        <p className='mb-0 my-n2'>{comment.content}</p>
      </Card.Body>
    </Card>
  )

}

const mapStateToProps = ({ currentUser }) => ({ currentUser })
export default connect(mapStateToProps, null)(Comment)