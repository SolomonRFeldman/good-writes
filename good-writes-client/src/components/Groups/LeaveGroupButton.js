import React from 'react';
import { connect } from 'react-redux';
import ModalButton from '../Modal/ModalButton';
import ButtonConfirmation from '../Modal/ButtonConfirmation';

function LeaveGroupButton(props) {
  const action = () => {
    const configObj = {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      }
    }
    if(localStorage.token) configObj.headers = { ...configObj.headers, "Token": localStorage.token }
    
    fetch(`/user_groups/${props.userGroup.id}`, configObj).then(response => response.json()).then(json => {
      props.triggerRedirect('/')
    })
  }
  const modalProps = {action: action, children: 'Are you sure you want to leave this group?'}

  return(
    <ModalButton Modal={ButtonConfirmation} modalProps={modalProps} variant='danger'>
      Leave Group
    </ModalButton>
  )

}

const mapDispatchToProps = dispatch => ({ 
  triggerRedirect: path => { dispatch({ type: 'TRIGGER_REDIRECT', path }) }
})

export default connect(null, mapDispatchToProps)(LeaveGroupButton)
