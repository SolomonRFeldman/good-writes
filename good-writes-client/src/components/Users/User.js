import React, { useState, useEffect } from 'react';
import Pieces from '../Pieces/Pieces'
import NewPieceButton from '../Pieces/NewPieceButton';
import PiecesFormFilterButtons from '../Pieces/PiecesFormFilterButtons';
import UserShowSidebar from './UserShowSidebar';
import { withRouter } from 'react-router-dom';
import { getRequest } from '../../fetchRequests';

function User(props) {

  const [user, setUser] = useState({ id: props.match.params.id, username: '', email: '', pieces: [], groups: [] })

  const [piecesFilter, setPiecesFilter] = useState()

  useEffect(() => {
    getRequest(`/users/${user.id}`).then(user => {
      user.status ? props.history.push('/') : setUser(user)
    })
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

export default withRouter(User)