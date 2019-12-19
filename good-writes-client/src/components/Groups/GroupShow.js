import React, { useState, useEffect } from 'react';
import GroupShowSidebar from './GroupShowSidebar';
import FeaturedPiece from './FeaturedPiece';
import { withRouter } from 'react-router-dom';

function GroupShow(props) {
  const [group, setGroup] = useState({featured_piece: {comments: []}, user_groups: []})
  const [userGroup, setUserGroup] = useState({valid_pieces: []})

  useEffect( () => {
    const configObj = {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      }
    }
    if(localStorage.token) configObj.headers = { ...configObj.headers, "Token": localStorage.token }

    fetch(`/groups/${props.match.params.id}`, configObj).then(response => response.json()).then(json => {
      if(json.status) {
        props.history.push('/')
      } else {
        setUserGroup(json.user_group)
        setGroup(json.group)
      }
    })
  }, [])

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

export default withRouter(GroupShow)