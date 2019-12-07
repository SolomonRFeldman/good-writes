export default function manageCurrentUser(state = { currentUser: { id: null, username: '' }, token: localStorage.token || '' }, action) {
  switch(action.type) {
    case 'ADD_CURRENT_USER':
      return { ...state, ...action.payload };
    case 'REMOVE_CURRENT_USER':
      return { ...state, ...{ currentUser: { id: null, username: '' }, token: '' } };
    default:
      return state;
  };
};