import React, { useState, useEffect } from 'react';
import Pieces from '../Pieces/Pieces'

export default function User(props) {

  const [user, setUser] = useState({ id: props.match.params.id, username: '', email: '', pieces: [], groups: [] })

  useEffect(() => {
    const configObj = {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Token": localStorage.token
      },
    }
    fetch(`/users/${user.id}`, configObj).then(response => response.json()).then(json => setUser(json))
  }, [])

  useEffect(() => console.log(user))

  return(
    <React.Fragment>
      <h1 className="display-3 text-center">Your Pieces</h1>
      <Pieces pieces={user.pieces} varient={'profile'} />
    </React.Fragment>
  )

}