"use client"
export const GET_USERS_FETCH = 'GET_USERS_FETCH';
export const GET_USERS_SUCCESS = 'GET_USERS_SUCCESS';


export const FETCH_EXAMPLE_DATA = 'FETCH_EXAMPLE_DATA';
export const SET_EXAMPLE_DATA = 'SET_EXAMPLE_DATA';

export const getUsersFetch = () => ({
    type: GET_USERS_FETCH
})


export const fetchExampleData = () => ({
  type: FETCH_EXAMPLE_DATA,
});

export const setExampleData = (data) => ({
  type: SET_EXAMPLE_DATA,
  payload: data,
});
