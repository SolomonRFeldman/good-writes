import React from 'react';
import ModalButton from '../Modal/ModalButton';
import NewGroupForm from './NewGroupForm';

export default function NewGroupButton(props) {

  return (
    <ModalButton Modal={NewGroupForm} variant={props.variant} className={props.className}>Make A Group</ModalButton>
  )

}

NewGroupButton.defaultProps = { variant: 'primary' }