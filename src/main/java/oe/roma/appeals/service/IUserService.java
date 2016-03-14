package oe.roma.appeals.service;

import oe.roma.appeals.domain.User;

import java.util.List;

public interface IUserService {

	/**
	 * Retrieves all users
	 * 
	 * @return list of users
	 */
	public List<User> getAll();

	/**
	 * Retrieves a single user based on id
	 * 
	 * @param id the id of the user
	 * @return the user
	 */
	public User get(Integer id);

	public void preAdd(User user);

	/**
	 * Add a new user
	 * 
	 * @param user the new user
	 * @return true if successful
	 */
	public void add(User user);

	/**
	 * Delete an existing user
	 * 
	 * @param user the existing user
	 * @return true if successful
	 */
	public void delete(User user);

	/**
	 * Edit an existing user
	 * 
	 * @param user the existing user
	 * @return true if successful
	 */
	public void edit(User user);

    public User getUserByName(String username);

}