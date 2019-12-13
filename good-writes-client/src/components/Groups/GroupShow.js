import React, { useState, useEffect } from 'react';
import GroupShowSidebar from './GroupShowSidebar';
import FeaturedPiece from './FeaturedPiece';

export default function GroupShow(props) {
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
      setUserGroup(json.user_group)
      setGroup(json.group)
      console.log(json)
    })
  }, [])
  
  return(
    <React.Fragment>
      <GroupShowSidebar userGroup={userGroup} group={group} setGroup={setGroup} />
      <div style={{paddingLeft: '300px'}}>
        <h1 className="display-3 text-center">{group.name}</h1>
        {group.featured_piece.id || !group.featured_piece.alias ? 
          <FeaturedPiece featured_piece={group.featured_piece} /> :
          <h2 class="text-center mt-5">({group.featured_piece.alias} hasn't selected their piece yet.)</h2>
        }
      </div>
    </React.Fragment>
  )

}