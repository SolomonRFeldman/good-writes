import React, { useState, useEffect } from 'react';
import Pieces from '../Pieces/Pieces'
import NewPieceButton from '../Pieces/NewPieceButton';
import PiecesFormFilterButtons from '../Pieces/PiecesFormFilterButtons';
import UserShowSidebar from './UserShowSidebar';

export default function User(props) {

  const [user, setUser] = useState({ id: props.match.params.id, username: '', email: '', pieces: [], groups: [] })
  useEffect(() => console.log(user), [user])

  const [piecesFilter, setPiecesFilter] = useState()

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

  return(
    <React.Fragment>
      <UserShowSidebar groups={user.groups} />
      <div style={{paddingLeft: '250px'}}>
        <h1 className="display-3 text-center">Your Pieces</h1>
        <NewPieceButton className='mx-auto d-block' />
        <PiecesFormFilterButtons className='mx-auto mt-4 d-block' setFilter={setPiecesFilter} />
        <Pieces pieces={user.pieces} variant={'profile'} formFilter={piecesFilter} />
      </div>
    </React.Fragment>
  )

}