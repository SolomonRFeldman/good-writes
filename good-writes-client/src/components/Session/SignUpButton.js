import React from 'react'
import ModalButton from '../Modal/ModalButton';
import SignUpForm from './SignUpForm';

export default function SignUpButton(props) {

  return (
    <ModalButton Modal={SignUpForm} variant={props.variant} className={props.className}>Sign Up</ModalButton>
  )

}

SignUpButton.defaultProps = { variant: 'secondary' }