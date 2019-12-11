import React, { useState, useEffect } from 'react';

export default function GroupShow(props) {
  const [group, setGroup] = useState({})
  const [userGroup, setUserGroup] = useState({})

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
      console.log(json)
      setGroup(json.group) }
    )
  }, [])
  
  return(
    <React.Fragment>
      <h1 className="display-3 text-center">{group.name}</h1>
    </React.Fragment>
  )

}