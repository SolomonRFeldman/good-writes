import React from 'react';
import Comment from './Comment';

export default function Comments(props) {

  return(
    props.comments.map(comment => {
      return <Comment key={comment.id} comment={comment} collection={{comments: props.comments, setComments: props.setComments}} />
    })
  )

}

Comments.defaultProps = {comments: []}