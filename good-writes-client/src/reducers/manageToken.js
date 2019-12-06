export default function manageToken(state = { token: localStorage.token || '' }, action) {
  switch(action.type) {
    case 'ADD_TOKEN':
      return { ...state, token: action.token };
    default:
      return state;
  };
};