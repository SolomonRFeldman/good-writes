import React from 'react';
import Card from 'react-bootstrap/Card';
import { connect } from 'react-redux';
import CommentButtons from './CommentButtons';

function Comment(props) {
  const commentButtons = () => {
    if(props.currentUser.id === props.comment.user_id) { return <CommentButtons className='float-right' />}
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

const mapStateToProps = ({ currentUser }) => ({ currentUser })
export default connect(mapStateToProps, null)(Comment)