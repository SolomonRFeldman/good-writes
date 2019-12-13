import React from 'react';
import Comment from './Comment';

export default function Comments(props) {
  console.log(props)

  return(
    props.comments.map(comment => {
      return <Comment comment={comment} collection={{comments: props.comments, setComments: props.setComments}} />
    })
  )

}