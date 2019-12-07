export default function manageCurrentUser(state = { currentUser: { user_id: null, username: '' }, token: localStorage.token || '' }, action) {
  switch(action.type) {
    case 'ADD_CURRENT_USER':
      return { ...state, ...action.payload };
    default:
      return state;
  };
};