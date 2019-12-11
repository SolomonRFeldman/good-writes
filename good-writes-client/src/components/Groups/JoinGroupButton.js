import React from 'react';
import ModalButton from '../Modal/ModalButton';
import JoinGroupForm from './JoinGroupForm';

export default function JoinGroupButton(props) {
  
  return(
    <ModalButton Modal={JoinGroupForm} modalProps={{group: props.group}} className={props.className} variant='success'>
      Join
    </ModalButton>
  )

}
