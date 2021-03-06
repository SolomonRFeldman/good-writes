import React, { useState, useEffect } from 'react';
import GroupShowSidebar from './GroupShowSidebar';
import FeaturedPiece from './FeaturedPiece';
import { useHistory } from 'react-router-dom';
import { getRequest } from '../../fetchRequests';

export default function GroupShow(props) {
  const history = useHistory()
  const [group, setGroup] = useState({featured_piece: {comments: []}, user_groups: []})
  const [userGroup, setUserGroup] = useState({valid_pieces: []})

  useEffect( () => {
    getRequest(`/groups/${props.match.params.id}`).then(json => {
      if(json.status) {
        history.replace('/')
      } else {
        setUserGroup(json.user_group)
        setGroup(json.group)
      }
    })
  }, [props.match.params.id])

  const displayPiece = () => {
    if(group.featured_piece.id) {
      return <FeaturedPiece userGroup={userGroup} featured_piece={group.featured_piece} />
    } else if(group.featured_piece.alias) {
      return <h2 className="text-center mt-5">({group.featured_piece.alias} hasn't selected their piece yet.)</h2>
    }
  }

  return(
    <React.Fragment>
      <GroupShowSidebar userGroup={userGroup} group={group} setGroup={setGroup} />
      <div style={{paddingLeft: '250px'}}>
        <h1 className="display-3 text-center">{group.name}</h1>
        {displayPiece()}
      </div>
    </React.Fragment>
  )

}