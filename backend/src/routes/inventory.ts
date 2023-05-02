import { Item } from "../models/types";
import { DataStoreService } from "../services/datastore";
import { Route } from "./route";

export const getInventory: Route = {
	route: "/inventory/:id",
	method: "get",
	handler: async (req, res) => {
		const id = req.params.id;
		const inventory = await DataStoreService.instance.getInventory(id);
		res.json(inventory).send();
	},
};

export const setInventoryItems: Route = {
	route: "/inventory/:id/items",
	method: "put",
	handler: async (req, res) => {
		const id = req.params.id;
		const items: Item[] = req.body;
		await DataStoreService.instance.setInventoryItems(id, items);
		res.status(200).send();
	},
};

export const addInventoryItems: Route = {
	route: "/inventory/:id/items",
	method: "put",
	handler: async (req, res) => {
		const id = req.params.id;
		const item: string = req.body;
		await DataStoreService.instance.addInventoryItems(id, item);
		res.status(200).send();
	},
};

export const removeInventoryItems: Route = {
	route: "/inventory/:id/items",
	method: "put",
	handler: async (req, res) => {
		const id = req.params.id;
		const item: string = req.body;
		await DataStoreService.instance.removeInventoryItems(id, item);
		res.status(200).send();
	},
};

