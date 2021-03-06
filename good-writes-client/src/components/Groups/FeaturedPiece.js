import React, { useState, useEffect } from 'react';
import Piece from '../Pieces/Piece';
import Comments from '../Comments/Comments';
import NewCommentForm from '../Comments/NewCommentForm';

export default function FeaturedPiece(props) {
  const [comments, setComments] = useState([])
  useEffect(() => setComments(props.featured_piece.comments), [props.featured_piece.comments])

  const canComment = () => {
    if(props.featured_piece.user_group_id !== props.userGroup.id) {
      return <NewCommentForm userGroup={props.userGroup} piece={props.featured_piece} comments={comments} setComments={setComments} />
    }
  }

  return(
    <React.Fragment>
      <h2 className="text-center">{props.featured_piece.alias}'s Piece: </h2>
      <Piece variant={'group-show'} piece={props.featured_piece} />
      <Comments comments={comments} setComments={setComments} />
      {canComment()}
    </React.Fragment>
  )

}