import { User } from "../models/types";
import { DataStoreService } from "../services/datastore";
import { Route } from "./route";

export const getAllUsers: Route = {
	route: "/users",
	method: "get",
	async handler(_, res) {
		const users = await DataStoreService.instance.getUsers();
		res.json(users).status(200).send();
	},
};

export const getUser: Route = {
	route: "/users/:uid",
	method: "get",
	async handler(req, res) {
		try {
			const user = await DataStoreService.instance.getUser(req.params.uid);
			res.json(user).status(200).send();
		} catch (e) {
			res.status(404).json({ error: "could not find user" }).send();
		}
	},
};

export const createUser: Route = {
	route: "/users",
	method: "post",
	async handler(req, res) {
		let userData: User = req.body;
		try {
			await DataStoreService.instance.createUser(userData);
			res.status(201).send();
		} catch (e) {
			res.json({ error: e }).status(500).send();
		}
	},
};
